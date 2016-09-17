package nslm2.modules.foundations.guildModule.view.panel.guildList
{
   import game.ui.guildModules.guildList.GuildListRenderUI;
   import proto.FamilyInfo;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FamilyFriendCount;
   import nslm2.utils.Uint64Util;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.display.DisplayObject;
   import morn.core.components.Label;
   import com.mz.core.mediators.RollMediator;
   
   public class GuildListRender extends GuildListRenderUI
   {
      
      private static const CROWN_SKIN:String = "png.a5.commonImgs.rank.img_crown";
       
      
      private var _data:FamilyInfo;
      
      private var guildModel:GuildModel;
      
      public function GuildListRender()
      {
         super();
         btn_option.clickHandler = btnClickHandler;
         guildModel = GuildModel.ins;
         toolTipArea.alpha = 0;
         this.parts.push(new RollMediator(this,rollHandler));
         img_select.visible = false;
      }
      
      private function btnClickHandler(param1:Object) : void
      {
         if(GuildUtil.checkJoinGuildCD(cearCDSuccess))
         {
            return;
         }
         GuildServiceHandler.ins.familyApply(_data.id);
      }
      
      private function cearCDSuccess() : void
      {
         guildModel.exitTimeStamp = 0;
         GuildServiceHandler.ins.familyApply(_data.id);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as FamilyInfo;
         if(_data)
         {
            txt_rank.text = _data.rank + "";
            txt_name.text = _data.name;
            txt_name.mouseChildren = false;
            txt_name.mouseEnabled = true;
            txt_name.addEventListener("click",clickNameHandler);
            txt_ownerName.text = LinkUtils.playerNameSmart(_data.leaderId,_data.leader,0);
            txt_level.text = _data.lv + "";
            txt_memberCnt.text = _data.count + "/" + _data.max;
            if(_data.invite)
            {
               btn_option.label = LocaleMgr.ins.getStr(999000277);
               btn_option.style = "按钮中绿";
            }
            else
            {
               btn_option.label = LocaleMgr.ins.getStr(11000835);
               btn_option.style = "按钮中棕";
            }
            if(guildModel.checkIsApplyed(_data.id))
            {
               btn_option.visible = false;
               txt_status.visible = true;
            }
            else
            {
               btn_option.visible = true;
               txt_status.visible = false;
            }
            img_bg.url = GuildUtil.getFlagBgUrl(_data.flagBase);
            img_icon.url = GuildUtil.getFlagIconUrl(_data.flagIcon);
            this.toolTip = _data.outNotice;
            txt_friendCnt.text = "0";
            var _loc4_:int = 0;
            var _loc3_:* = GuildModel.ins.guildFriendCntArr;
            for each(var _loc2_ in GuildModel.ins.guildFriendCntArr)
            {
               if(Uint64Util.equal(_loc2_.id,_data.id))
               {
                  txt_friendCnt.text = _loc2_.count + "";
               }
            }
            switch(int(_data.rank) - 1)
            {
               case 0:
                  img_crwon.skin = "png.a5.commonImgs.rank.img_crown" + 1;
                  changeTextColor(16542720);
                  break;
               case 1:
                  img_crwon.skin = "png.a5.commonImgs.rank.img_crown" + 2;
                  changeTextColor(12798193);
                  break;
               case 2:
                  img_crwon.skin = "png.a5.commonImgs.rank.img_crown" + 3;
                  changeTextColor(4827135);
            }
         }
         .super.dataSource = param1;
      }
      
      protected function clickNameHandler(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(40709,_data.id,40711);
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
