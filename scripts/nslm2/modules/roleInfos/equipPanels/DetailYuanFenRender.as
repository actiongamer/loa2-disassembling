package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.DetailYuanfenInfoRenderUI;
   
   public class DetailYuanFenRender extends DetailYuanfenInfoRenderUI
   {
       
      
      public function DetailYuanFenRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:String = param1 as String;
         txt_name.text = _loc2_;
      }
   }
}
