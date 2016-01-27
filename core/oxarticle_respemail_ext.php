<?php
class oxarticle_respemail_ext extends oxarticle_respemail_ext_parent {
  /**
  * calculate the width for product picture thumbnails
  *
  * prevents that pictures that are higher than they are wide will appear larger than other pictures, if we set them only them a width
  * this will only applied to Outlook, since in the other browser the CSS is set by max-width and max-height
  *
  * @return the width
  */
  public function getResponsiveEmailThumbnailSize() {
    $iBaseWidth = 170;

    $dims = $this->getMasterZoomPictureDimensions(1);
    $proportion = (float) $dims['width'] / (float) $dims['height'];
    return round($iBaseWidth * min(1, $proportion));
  }

  /**
  * get image dimensions of the master pictures
  * needed for the PhotoSwipe library
  *
  * @param int $iIndex the index of the picture
  * @return array width and height of the picture
  */
  public function getMasterZoomPictureDimensions($iIndex) {
    $myConfig = $this->getConfig();
    $sPicName = basename($this->{"oxarticles__oxpic" . $iIndex}->value);
    if($sPicName == "nopic.jpg") return false;
    $sPicPath = $myConfig->getPictureDir(false)."master/product/" . $iIndex . "/" . $sPicName;
    $aImgSize = getimagesize($sPicPath);
    $ret = array(
      "width" => $aImgSize[0],
      "height" => $aImgSize[1]
      );
    return $ret;
  }
}
