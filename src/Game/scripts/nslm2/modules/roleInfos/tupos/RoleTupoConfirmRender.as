package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.RoleTupoConfirmRenderUI;
   import proto.PanelBaseInfo;
   import nslm2.common.model.HeroModel;
   import com.mz.core.utils.FilterUtil;
   
   public class RoleTupoConfirmRender extends RoleTupoConfirmRenderUI
   {
       
      
      public function RoleTupoConfirmRender()
      {
         super();
      }
      
      public function get vo() : PanelBaseInfo
      {
         return this.dataSource as PanelBaseInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.render_player.dataSource = param1;
         if(param1)
         {
            if(HeroModel.ins.isDefaultHero(vo))
            {
               this.render_player.img_icon.filters = null;
            }
            else
            {
               this.render_player.img_icon.filters = [FilterUtil.grayFilter()];
            }
         }
      }
   }
}
