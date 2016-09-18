package nslm2.modules.foundations.guildModule.view.panel.setAuth
{
   import game.ui.guildModules.setting.AuthorityListRenderUI;
   import nslm2.modules.foundations.guildModule.vo.AuthorityVo;
   
   public class AuthorityListRender extends AuthorityListRenderUI
   {
       
      
      private var _data:AuthorityVo;
      
      public function AuthorityListRender()
      {
         super();
         selectBox.clickHandler = changeSelect;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as AuthorityVo;
         if(_data)
         {
            txt_name.text = _data.name;
            selectBox.selected = _data.selected;
         }
      }
      
      private function changeSelect(param1:Object) : void
      {
         _data.selected = !_data.selected;
         selectBox.selected = _data.selected;
      }
   }
}
