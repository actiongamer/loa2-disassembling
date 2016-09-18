package nslm2.modules.roleInfos
{
   import game.ui.roleInfos.RoleSelectListPanelUI;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS1;
   import com.mz.core.event.MzEvent;
   import proto.PanelBaseInfo;
   import nslm2.common.compsEffects.ListSelectSlideEffectS2;
   
   public class RoleSelectListPanel extends RoleSelectListPanelUI
   {
       
      
      public function RoleSelectListPanel()
      {
         super();
         this.list_role.changeHandler = list_onSelect;
         this.parts.push(new ListSelectSlideEffectS2(this.list_role));
         (pageBar as PageBarS1).bindList(list_role);
      }
      
      public function show(param1:Array) : void
      {
         this.list_role.selectEnable = true;
         this.list_role.dataSource = param1;
      }
      
      public function toSelectIndex(param1:int) : void
      {
         (pageBar as PageBarS1).ctrl.goToSelectIndex(param1);
      }
      
      private function list_onSelect() : void
      {
         this.dispatchEvent(new MzEvent("listSelectHero",list_role.selectedItem as PanelBaseInfo));
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
