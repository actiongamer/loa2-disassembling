package nslm2.modules.cultivates.skillChangePanels
{
   import game.ui.skillChangePanel.SkillSelectPanelUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class SkillSelectPanel extends SkillSelectPanelUI
   {
       
      
      public function SkillSelectPanel()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(30106000);
         this.pageBar.bindList(this.list_items);
         this.fadeViewId = 11010;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarRef as IPageBar;
      }
      
      public function show(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         switch(int(param1))
         {
            case 0:
               this.fadeIn(0,11010);
               _loc2_ = SkillChangeModel.ins.getNorSkillList();
               _loc4_ = this.list_items.repeatX * this.list_items.repeatY;
               _loc3_ = _loc2_.length % _loc4_ == 0?0:Number(_loc4_ - _loc2_.length % _loc4_);
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc2_.push(0);
                  _loc5_++;
               }
               this.list_items.dataSource = _loc2_;
               this.list_items.selectedIndex = 0;
               this.list_items.page = 0;
               break;
            case 1:
               this.fadeIn(0,11010);
               _loc2_ = SkillChangeModel.ins.getSpeSkillList();
               _loc4_ = this.list_items.repeatX * this.list_items.repeatY;
               _loc3_ = _loc2_.length % _loc4_ == 0?0:Number(_loc4_ - _loc2_.length % _loc4_);
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc2_.push(0);
                  _loc5_++;
               }
               this.list_items.dataSource = _loc2_;
               this.list_items.selectedIndex = 0;
               this.list_items.page = 0;
               break;
            case 2:
               this.fadeIn(0,11010);
               _loc2_ = SkillChangeModel.ins.getAuraList();
               _loc4_ = this.list_items.repeatX * this.list_items.repeatY;
               _loc3_ = _loc2_.length % _loc4_ == 0?0:Number(_loc4_ - _loc2_.length % _loc4_);
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc2_.push(0);
                  _loc5_++;
               }
               this.list_items.dataSource = _loc2_;
               this.list_items.selectedIndex = 0;
               this.list_items.page = 0;
         }
      }
   }
}
