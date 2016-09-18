package nslm2.modules.foundations.setting.view
{
   import game.ui.settingModule.view.FuncSettingListRenderUI;
   import nslm2.modules.foundations.setting.vo.RefuseVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class FuncSettingListRender extends FuncSettingListRenderUI
   {
       
      
      private var _data:RefuseVo;
      
      public function FuncSettingListRender()
      {
         super();
         checkBox.clickHandler = changeSelect;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as RefuseVo;
         if(_data)
         {
            checkBox.label = LocaleMgr.ins.getStr(_data.id);
            checkBox.selected = _data.selected;
         }
      }
      
      private function changeSelect(param1:Object) : void
      {
         _data.selected = !_data.selected;
         checkBox.selected = _data.selected;
      }
   }
}
