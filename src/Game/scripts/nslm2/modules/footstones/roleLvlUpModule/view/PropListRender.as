package nslm2.modules.footstones.roleLvlUpModule.view
{
   import game.ui.lvlUpModules.PropListRenderUI;
   import nslm2.modules.footstones.roleLvlUpModule.vo.PropVo;
   
   public class PropListRender extends PropListRenderUI
   {
       
      
      private var _data:PropVo;
      
      public function PropListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as PropVo;
         if(_data)
         {
            txt_name.text = _data.name;
            txt_oldValue.num = _data.oldValue;
            txt_newValue.num = _data.newValue;
         }
      }
   }
}
