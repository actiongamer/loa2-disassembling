package nslm2.common.ui.components.comps2d
{
   import game.ui.commons.icons.HeroRenderS1UI;
   import proto.PanelBaseInfo;
   import nslm2.utils.PlayerVoUtils;
   
   public class HeroRenderS1 extends HeroRenderS1UI
   {
       
      
      private var _panelBaseInfo:PanelBaseInfo;
      
      public function HeroRenderS1()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1)
         {
            _panelBaseInfo = param1 as PanelBaseInfo;
            .super.dataSource = PlayerVoUtils.panelBaseInfoToVo(_panelBaseInfo);
         }
      }
   }
}
