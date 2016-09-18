package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleMengYuePropRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class RoleMengYuePropRender extends RoleMengYuePropRenderUI
   {
       
      
      public function RoleMengYuePropRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.mengYueVo)
         {
            this.toolTip = this.mengYueVo.stcMengyueVo;
            this.img_iconMengYue.url = UrlLib.mengYueIcon(this.mengYueVo.mengYueId);
         }
      }
      
      override public function get vo() : NpcPropVo
      {
         if(this.mengYueVo)
         {
            return this.mengYueVo.propVo;
         }
         return null;
      }
      
      public function get mengYueVo() : MengYuePropVo
      {
         return this.dataSource as MengYuePropVo;
      }
      
      override public function validateValue() : void
      {
         if(this.ref_txt_value)
         {
            if(vo != null)
            {
               this.ref_txt_value.text = LocaleConsts.percentStr(vo.value);
            }
            else
            {
               this.ref_txt_value.text = LocaleConsts.percentStr(0);
            }
         }
      }
   }
}
