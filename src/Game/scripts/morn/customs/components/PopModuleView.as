package morn.customs.components
{
   import nslm2.utils.LayerUtil;
   import flash.geom.Point;
   import com.display.game.anim.FrameAnimConst;
   import com.display.game.anim.TweenAnimVO;
   import com.display.game.anim.TweenAnimManager;
   import nslm2.mgrs.SoundMgr;
   import com.greensock.TweenLite;
   import nslm2.utils.TweenProxy;
   import com.greensock.easing.Back;
   import com.greensock.easing.Cubic;
   
   public class PopModuleView extends ModuleViewBase
   {
       
      
      public var moduleFadeInType:int = 1;
      
      public var moduleFadeOutType:int = 2;
      
      private var popModuleView_tweenProxy:TweenProxy;
      
      public function PopModuleView()
      {
         popModuleView_tweenProxy = new TweenProxy(this);
         super();
      }
      
      override public function initXY() : void
      {
         this.x = LayerUtil.centerX(this);
         this.y = LayerUtil.centerY(this);
      }
      
      override public function moduleFadeIn(param1:Number = 0) : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         this.visible = true;
         if(this.moduleFadeInType == 1)
         {
            this.useResetPosition = false;
            _loc5_ = new Point(this.x,this.y);
            this.x = this.parent.mouseX;
            this.y = this.parent.mouseY;
            setArrangeXY(_loc5_);
            _loc2_ = FrameAnimConst.getFrameAnim(this,"normal_scale_show",animCpl,null);
            TweenAnimManager.getInstance().playAnim(_loc2_);
            SoundMgr.ins.playTexiaoSound("open_ui");
            super.moduleFadeIn(0.5);
         }
         else if(this.moduleFadeInType == 2)
         {
            _loc4_ = this.y;
            this.y = _loc4_ + 40;
            this.alpha = 0;
            TweenLite.to(this,0.4,{
               "y":_loc4_,
               "alpha":1,
               "onComplete":this.moduleFadeInTypeCpl
            });
            super.moduleFadeIn(0.5);
         }
         else if(this.moduleFadeInType == 25)
         {
            _loc3_ = this.x;
            this.x = _loc3_ + 40;
            this.alpha = 0;
            TweenLite.to(this,0.4,{
               "x":_loc3_,
               "alpha":1,
               "onComplete":this.moduleFadeInTypeCpl
            });
            super.moduleFadeIn(0.5);
         }
         else
         {
            moduleFadeInTypeCpl();
            super.moduleFadeIn();
         }
      }
      
      public function setArrangeXY(param1:Point) : void
      {
         var _loc3_:* = NaN;
         var _loc2_:Number = NaN;
         if(this.x != param1.x || this.y != param1.y)
         {
            TweenLite.killTweensOf(popModuleView_tweenProxy);
            _loc2_ = Point.distance(new Point(this.x,this.y),param1);
            if(_loc2_ < 500)
            {
               _loc3_ = Number(Math.max(0.3,0.4 * (_loc2_ / 500)));
            }
            else
            {
               _loc3_ = 0.4;
            }
            TweenLite.to(popModuleView_tweenProxy,_loc3_,{
               "x":param1.x,
               "ease":Back.easeOut,
               "overwrite":0
            });
            TweenLite.to(popModuleView_tweenProxy,_loc3_,{
               "y":param1.y,
               "ease":Cubic.easeOut,
               "overwrite":0
            });
         }
      }
      
      private function animCpl(... rest) : void
      {
         this.useResetPosition = true;
         moduleFadeInTypeCpl();
      }
      
      protected function moduleFadeInTypeCpl() : void
      {
      }
      
      override protected function moduleFadeOutCpl() : void
      {
         if(!(int(moduleFadeOutType) - 2))
         {
            this.useResetPosition = false;
            SoundMgr.ins.playTexiaoSound("close_ui");
            TweenLite.killTweensOf(popModuleView_tweenProxy);
            TweenLite.to(popModuleView_tweenProxy,0.2,{
               "y":this.y + 20,
               "alpha":0,
               "onComplete":this.moduleFadeOutTweenOutCpl
            });
         }
         else
         {
            super.moduleFadeOutCpl();
         }
      }
      
      public function switchByUIPanel3D(param1:Boolean, param2:int) : void
      {
         this.setVisibleList("MODULE_POP_HIDE_OTHER_3D" + param2,!param1);
      }
      
      private function moduleFadeOutTweenOutCpl() : void
      {
         super.moduleFadeOutCpl();
      }
   }
}
