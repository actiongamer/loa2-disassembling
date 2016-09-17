package nslm2.modules.foundations.guildModule.view.panel.manage
{
   import game.ui.guildModules.manageView.ManagerListRenderUI;
   import nslm2.modules.foundations.guildModule.vo.GuildManageVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class GuildManageListRender extends ManagerListRenderUI
   {
      
      private static const TITLE_IMG_SKIN:String = "png.uiGuildModule.manage.img_ManaTitle";
       
      
      private var _data:GuildManageVo;
      
      public function GuildManageListRender()
      {
         super();
         this.parts.push(new RollHighLightMediator(this));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as GuildManageVo;
         img_redPoint.visible = false;
         if(_data)
         {
            lTitle.text = LocaleMgr.ins.getStr(999900198 + _data.id);
            img_icon.url = UrlLib.getGuildManageIcon(_data.id);
            if(_data.status)
            {
               box_content.disabled = false;
               img_lock.visible = false;
            }
            else
            {
               box_content.disabled = true;
               img_lock.visible = true;
            }
            if(_data.status == 2)
            {
               img_redPoint.visible = true;
            }
            else
            {
               img_redPoint.visible = false;
            }
         }
         .super.dataSource = param1;
      }
   }
}
