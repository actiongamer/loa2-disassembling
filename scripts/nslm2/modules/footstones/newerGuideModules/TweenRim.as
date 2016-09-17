package nslm2.modules.footstones.newerGuideModules
{
   import com.mz.core.components.comp2d.BlackRim;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import flash.geom.Rectangle;
   import com.mz.core.mgrs.UIMgr;
   
   class TweenRim extends BlackRim
   {
       
      
      private var _progress:Number;
      
      function TweenRim()
      {
         super();
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.fileAlpha = 0.3;
         this.visible = false;
      }
      
      public function play() : void
      {
         this.visible = true;
         this.alpha = 1;
         this.progress = 0;
         TweenLite.killTweensOf(this);
         TweenLite.to(this,0.5,{
            "progress":1,
            "ease":Cubic.easeOut
         });
         TweenLite.to(this,0.5,{
            "delay":0.6,
            "alpha":0,
            "visible":false
         });
      }
      
      public function drawHole(param1:Rectangle) : void
      {
         this.graphics.clear();
         this.graphics.beginFill(fileColor,fileAlpha);
         this.graphics.drawRect(0,0,_w,_h);
         this.graphics.lineStyle(2,16776960);
         this.graphics.drawRoundRect(param1.x,param1.y,param1.width,param1.height,8,8);
         this.graphics.endFill();
      }
      
      public function get progress() : Number
      {
         return _progress;
      }
      
      public function set progress(param1:Number) : void
      {
         var _loc2_:* = null;
         if(_progress != param1)
         {
            _progress = param1;
            _loc2_ = new Rectangle();
            _loc2_.x = hole.x * progress;
            _loc2_.y = hole.y * progress;
            _loc2_.width = UIMgr.gameWidth + (hole.width - UIMgr.gameWidth) * progress;
            _loc2_.height = UIMgr.gameHeight + (hole.height - UIMgr.gameHeight) * progress;
            this.drawHole(_loc2_);
         }
      }
   }
}
