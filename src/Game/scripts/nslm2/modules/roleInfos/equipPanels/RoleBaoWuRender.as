package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleBaoWuRenderUI;
   import nslm2.common.vo.WealthVo;
   
   public class RoleBaoWuRender extends RoleBaoWuRenderUI
   {
      
      public static const bgSkin:String = "png.uiRoleInfo.img_equipRenderBg";
       
      
      public function RoleBaoWuRender()
      {
         super();
         img_icon.smoothing = true;
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(equipVo)
         {
            return equipVo.wealthVo;
         }
         return null;
      }
      
      public function get equipVo() : HeroEquipVo
      {
         return dataSource as HeroEquipVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(equipVo)
         {
            this.img_bg.skin = "png.uiRoleInfo.img_equipRenderBg" + equipVo.place;
         }
      }
   }
}
