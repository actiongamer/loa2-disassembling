package nslm2.modules.funnies.busyActivity.dragonBoats.funnys
{
   import game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyProductRenderUI;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import proto.StaticDragonBoatMakeModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class DragonBoatFunnyProductRender extends DragonBoatFunnyProductRenderUI
   {
       
      
      private var _vo:StaticDragonBoatMakeModel;
      
      private var _eff:BmcSpriteSheet;
      
      public function DragonBoatFunnyProductRender()
      {
         super();
      }
      
      public function tweenTo(param1:Point) : void
      {
         TweenLite.to(this,0.3,{
            "x":param1.x,
            "y":param1.y
         });
      }
      
      public function get vo() : StaticDragonBoatMakeModel
      {
         return _vo;
      }
      
      public function set vo(param1:StaticDragonBoatMakeModel) : void
      {
         _vo = param1;
         if(_vo)
         {
            this.wealthVo = WealthUtil.createItemVo(param1.id,1);
         }
      }
      
      public function switchEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(_eff == null)
            {
               _eff = new BmcSpriteSheet();
               _eff.x = -52;
               _eff.y = -52;
               _eff.init(3060006,1,"all",true);
               _eff.scale = 0.888888888888889;
               _eff.mouseEvent = false;
               this.addChild(_eff);
            }
            else
            {
               _eff.visible = true;
            }
         }
         else
         {
            _eff.visible = false;
         }
      }
   }
}
