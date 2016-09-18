package nslm2.modules.roleInfos.awake.render
{
   import game.ui.roleInfos.awake.render.RoleAwakeEquipPropRenderUI;
   import nslm2.common.consts.NPCPropConsts;
   import flash.filters.GlowFilter;
   
   public class RoleAwakeEquipPropRender extends RoleAwakeEquipPropRenderUI
   {
       
      
      public function RoleAwakeEquipPropRender()
      {
         super();
         txt_value.size = 18;
         txt_value.labelFilterKind = "无";
         txt_value.font = "Microsoft YaHei,微软雅黑";
         txt_value.skin = "png.uiRoleInfo.awake.FontBg";
         txt_value.useTextMask = true;
         txt_value.bold = false;
         txt_value.filters = [new GlowFilter(0,1,2,2,4)];
         txt_value.margin = "0,-2,0,0";
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.ref_txt_name.text = NPCPropConsts.ins.getLocaleNameShort2(vo.propId) + "：";
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
   }
}
