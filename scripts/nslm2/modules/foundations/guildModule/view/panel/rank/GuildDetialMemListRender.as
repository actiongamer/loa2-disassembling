package nslm2.modules.foundations.guildModule.view.panel.rank
{
   import game.ui.guildModules.guildRank.GuildDetailMemListRenderUI;
   import proto.FamilyMember;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import com.mz.core.mediators.RollMediator;
   
   public class GuildDetialMemListRender extends GuildDetailMemListRenderUI
   {
       
      
      private var _data:FamilyMember;
      
      public function GuildDetialMemListRender()
      {
         super();
         this.parts.push(new RollMediator(this,rollHandler));
         img_select.visible = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as FamilyMember;
         if(_data)
         {
            txt_name.text = LinkUtils.playerNameSmart(_data.id,_data.name,0);
            txt_power.text = Uint64Util.toString(_data.ability);
            txt_lvl.text = _data.level + "";
            txt_pos.text = GuildUtil.getPostName(_data.post);
            if(_data.highPost)
            {
               txt_pos.text = GuildUtil.getPostName(_data.highPost);
            }
         }
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         img_select.visible = param1;
      }
   }
}
