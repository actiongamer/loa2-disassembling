package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import com.greensock.TimelineLite;
   import morn.core.components.Image;
   import com.greensock.TweenLite;
   
   public class ImgHeartEffect implements IDispose
   {
       
      
      private var _timeLine:TimelineLite;
      
      private var _image:Image;
      
      private var _effectImage:Image;
      
      private var _oriScale:Number;
      
      public function ImgHeartEffect(param1:Image)
      {
         super();
         _image = param1;
         _oriScale = _image.scale;
         _effectImage = new Image(param1.url);
         _effectImage.mouseChildren = false;
         _effectImage.mouseEnabled = false;
         _effectImage.anchorX = 0.5;
         _effectImage.anchorY = 0.5;
         _effectImage.visible = false;
         _effectImage.x = param1.x;
         _effectImage.y = param1.y;
         _image.parent.addChild(_effectImage);
         playAnim();
      }
      
      private function playAnim() : void
      {
         _effectImage.visible = true;
         _effectImage.alpha = 1;
         _effectImage.scale = 1;
         _timeLine = new TimelineLite();
         _timeLine.append(TweenLite.to(this._image,0.2,{"scale":1.2}));
         _timeLine.append(TweenLite.to(this._image,0.2,{"scale":1}));
         _timeLine.append(new TweenLite(_image,1,{"onComplete":playEnd}));
         TweenLite.to(this._effectImage,1,{
            "scale":2,
            "alpha":0
         });
         _timeLine.play();
      }
      
      private function playEnd() : void
      {
         _timeLine = null;
         playAnim();
      }
      
      public function stop() : void
      {
         if(_timeLine != null)
         {
            _timeLine.stop();
            _timeLine = null;
            TweenLite.killTweensOf(this._effectImage);
            _effectImage.dispose();
         }
      }
      
      public function dispose() : void
      {
         stop();
         _image.scale = _oriScale;
      }
   }
}
