package nslm2.modules.funnies.busyActivity.towers.funnys
{
   import game.ui.busyActivity.towers.funnys.TowerFunnyCellRenderUI;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Component;
   import game.ui.busyActivity.towers.funnys.TowerFunnyIconDownUI;
   import game.ui.busyActivity.towers.funnys.TowerFunnyIconUpUI;
   import morn.customs.FilterLib;
   
   public class TowerFunnyCellRender extends TowerFunnyCellRenderUI
   {
       
      
      private var icon:Component;
      
      public function TowerFunnyCellRender()
      {
         super();
      }
      
      public function get vo() : WealthVo
      {
         return this.dataSource as WealthVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.disposeIcon();
            this.renderWealth.wealthVo = this.vo;
         }
      }
      
      public function showIconDown() : void
      {
         if(icon is TowerFunnyIconDownUI)
         {
            if(!(icon is TowerFunnyIconDownUI))
            {
               icon.dispose();
               icon = null;
            }
         }
         if(icon == null)
         {
            icon = new TowerFunnyIconDownUI();
            this.addChild(icon);
            icon.mouseEvent = false;
         }
      }
      
      public function showIconUp() : void
      {
         if(icon is TowerFunnyIconUpUI)
         {
            if(!(icon is TowerFunnyIconUpUI))
            {
               icon.dispose();
               icon = null;
            }
         }
         if(icon == null)
         {
            icon = new TowerFunnyIconUpUI();
            this.addChild(icon);
            icon.mouseEvent = false;
         }
      }
      
      public function disposeIcon() : void
      {
         if(icon)
         {
            icon.dispose();
            icon = null;
         }
      }
      
      override public function dispose() : void
      {
         this.disposeIcon();
         super.dispose();
      }
      
      public function switchSelected(param1:Boolean) : void
      {
         if(param1)
         {
            this.renderWealth.filters = [FilterLib.BORDER_YELLOW];
         }
         else
         {
            this.renderWealth.filters = [];
         }
      }
   }
}
