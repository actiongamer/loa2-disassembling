package nslm2.modules.cultivates.otherRoleInfos
{
   import game.ui.otherRoleInfos.render.OtherRoleListPetRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class OtherRoleListPetRender extends OtherRoleListPetRenderUI
   {
       
      
      public function OtherRoleListPetRender()
      {
         super();
         this.needShowValidBg = true;
         this.txt_openLvl.text = LocaleMgr.ins.getStr(9000000 + 32000);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_openLvl.visible = false;
            this.img_lock.visible = false;
         }
         else
         {
            this.txt_openLvl.visible = true;
            this.img_lock.visible = true;
         }
      }
   }
}
