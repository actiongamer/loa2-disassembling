package nslm2.modules.funnies.dials.renders
{
   import game.ui.dialModule.renders.DialItemRenderUI;
   import proto.StaticZhuanPanItemModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.utils.StringUtils;
   
   public class DialItemRender extends DialItemRenderUI
   {
       
      
      private var _eff:BmcSpriteSheet;
      
      private var _eff2:BmcSpriteSheet;
      
      public function DialItemRender()
      {
         super();
      }
      
      public function get vo() : StaticZhuanPanItemModel
      {
         return this.dataSource as StaticZhuanPanItemModel;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.render_wealth.dataSource = WealthUtil.parseCostStr(vo.item);
            showEffect();
         }
      }
      
      private function showEffect() : void
      {
         if(StringUtils.isNull(vo.supweight) == false)
         {
            if(!_eff)
            {
               _eff = new BmcSpriteSheet();
               _eff.x = -18;
               _eff.y = -10;
               _eff.init(800000,1,"all",true);
               _eff.scale = 0.75;
               this.addChild(_eff);
            }
            if(!_eff2)
            {
               _eff2 = new BmcSpriteSheet();
               _eff2.x = -10;
               _eff2.y = -11;
               _eff2.init(1152,1,"all",true);
               _eff2.scale = 0.9;
               this.addChild(_eff2);
            }
         }
         else
         {
            if(_eff)
            {
               _eff.dispose();
               _eff = null;
            }
            if(_eff2)
            {
               _eff2.dispose();
               _eff2 = null;
            }
         }
      }
   }
}
