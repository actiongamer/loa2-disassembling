package nslm2.modules.foundations.guildModule.view.panel.rank
{
   import game.ui.guildModules.guildRank.GuildRankListRenderUI;
   import proto.FamilyInfo;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.display.DisplayObject;
   import morn.core.components.Label;
   import com.mz.core.mediators.RollMediator;
   
   public class GuildRankListRender extends GuildRankListRenderUI
   {
      
      private static const CROWN_SKIN:String = "png.a5.commonImgs.rank.img_crown";
       
      
      private var _data:FamilyInfo;
      
      public function GuildRankListRender()
      {
         super();
         this.parts.push(new RollMediator(this,rollHandler));
         img_select.visible = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as FamilyInfo;
         if(_data)
         {
            txt_rank.text = _data.rank + "";
            txt_name.text = _data.name;
            txt_owner.text = _data.leader;
            txt_owner.text = LinkUtils.playerNameSmart(_data.leaderId,_data.leader,0);
            txt_lvl.text = _data.lv + "";
            txt_member.text = _data.count + "/" + _data.max;
            txt_power.text = _data.ability.toString();
            img_bg.url = GuildUtil.getFlagBgUrl(_data.flagBase);
            img_icon.url = GuildUtil.getFlagIconUrl(_data.flagIcon);
            img_crown.visible = true;
            txt_name.mouseChildren = false;
            txt_name.mouseEnabled = true;
            txt_name.addEventListener("click",clickNameHandler);
            switch(int(_data.rank) - 1)
            {
               case 0:
                  img_crown.skin = "png.a5.commonImgs.rank.img_crown" + 1;
                  changeTextColor(16542720);
                  break;
               case 1:
                  img_crown.skin = "png.a5.commonImgs.rank.img_crown" + 2;
                  changeTextColor(12798193);
                  break;
               case 2:
                  img_crown.skin = "png.a5.commonImgs.rank.img_crown" + 3;
                  changeTextColor(4827135);
            }
            this.toolTip = _data.outNotice;
         }
         .super.dataSource = param1;
      }
      
      protected function clickNameHandler(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(40709,_data.id,40700);
      }
      
      private function changeTextColor(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = this.numChildren;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this.getChildAt(_loc5_);
            if(_loc3_ is Label)
            {
               (_loc3_ as Label).color = param1;
            }
            _loc5_++;
         }
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         img_select.visible = param1;
      }
   }
}
