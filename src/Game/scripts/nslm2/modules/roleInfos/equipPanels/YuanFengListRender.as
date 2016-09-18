package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.YuanFenRenderUI;
   
   public class YuanFengListRender extends YuanFenRenderUI
   {
       
      
      private var _data:nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
      
      public function YuanFengListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
         if(_data)
         {
            img_dot.disabled = !_data.isActivate;
            txt_name.color = !!_data.isActivate?14708265:7631987;
            txt_name.text = _data.name;
         }
      }
   }
}
