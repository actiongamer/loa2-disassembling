package nslm2.modules.foundations.guildModule.view.panel.flag
{
   import game.ui.guildModules.flag.GuildFlagRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiFlagVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class GuildFlagRender extends GuildFlagRenderUI
   {
       
      
      private var _data:StcGonghuiFlagVo;
      
      public function GuildFlagRender()
      {
         super();
         this.parts.push(new RollHighLightMediator(this));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         _data = param1 as StcGonghuiFlagVo;
         if(_data)
         {
            switch(int(_data.kind) - 1)
            {
               case 0:
                  _loc2_ = UrlLib.guildFlagBg(_data.icon);
                  break;
               case 1:
                  _loc2_ = UrlLib.guildFlagPattern(_data.icon);
            }
            img.url = _loc2_;
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         img_selected.visible = param1 == 3;
      }
   }
}
