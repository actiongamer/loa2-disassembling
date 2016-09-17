package nslm2.modules.roleInfos.tipMenuHandler
{
   import nslm2.modules.footstones.tipMenus.handlers.TipMenuHandlerBase;
   import nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
   
   public class SwapEquipBtnHandler extends TipMenuHandlerBase
   {
       
      
      public function SwapEquipBtnHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         (data as EquipHeroPosVo).swapEquipCallBack();
      }
   }
}
