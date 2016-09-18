package nslm2.modules.funnies.guilds.guildTechs
{
   import game.ui.guildTechs.GuildTechResearchRenderUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import proto.FamilyTechItem;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyTechCostVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.utils.TimeUtils;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import proto.FamilyTechResearchReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyTechResearchRes;
   import nslm2.nets.sockets.ServerEvent;
   import morn.customs.expands.MornExpandUtil;
   
   public class GuildTechResearchRender extends GuildTechResearchRenderUI
   {
       
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      private var _vo:FamilyTechItem;
      
      public var familyStcVo:StcFamilyTechCostVo;
      
      public var canResearch:Boolean = false;
      
      public function GuildTechResearchRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this._textCdCtrl = new TextCDCtrlS2(this.txt_cd,textCDFormat,txtCDCtrl_cpl);
      }
      
      public function get service() : GuildTechService
      {
         return GuildTechService.ins;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.vo = param1 as FamilyTechItem;
      }
      
      public function get vo() : FamilyTechItem
      {
         return _vo;
      }
      
      public function set vo(param1:FamilyTechItem) : void
      {
         _vo = param1;
         this.refresh();
      }
      
      private function refresh() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_vo)
         {
            familyStcVo = GuildTechService.findStcVoByTechtypeAndRank(vo.techtype,vo.familytechlevel);
            _loc3_ = GuildTechService.findStcVoByTechtypeAndRank(vo.techtype,vo.familytechlevel + 1);
            this.img_icon.url = UrlLib.propS2(1);
            _loc1_ = LocaleMgr.ins.getStr(1200 + familyStcVo.techtype);
            this.txt_tip.text = _loc1_ + "Lv." + vo.familytechlevel;
            this.canResearch = false;
            if(_loc3_)
            {
               this.btn_get.visible = true;
               this.txt_tip2.text = LocaleMgr.ins.getStr(999000427) + TextFieldUtil.htmlText2("+" + (NpcPropVo.parseStr(_loc3_.effect).value - int(NpcPropVo.parseStr(familyStcVo.effect).value)),458496);
               this.btn_get.toolTip = LocaleMgr.ins.getStr(999000428) + familyStcVo.cost + LocaleMgr.ins.getStr(999000429) + (vo.familytechlevel + 1);
               if(vo.familytechlevel < service.infoRes.highestlevel)
               {
                  if(GuildModel.ins.guildInfo.fund >= familyStcVo.cost)
                  {
                     this.canResearch = true;
                  }
               }
            }
            else
            {
               this.btn_get.visible = false;
               this.txt_tip2.text = LocaleMgr.ins.getStr(999000430);
            }
            if(canResearch == false || this.service.infoRes.curreshitem != 0)
            {
               this.btn_get.filters = null;
            }
            _loc2_ = service.curReshStcVo;
            if(service.curReshStcVo && _loc2_.techtype == this.vo.techtype)
            {
               this.btn_get.visible = false;
               this._textCdCtrl.start(GuildTechService.ins.infoRes.lastreshtime);
               this.txt_cd.visible = true;
            }
            else
            {
               this.txt_cd.visible = false;
               _textCdCtrl.stop();
            }
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return TimeUtils.hisCNFull2(param1);
      }
      
      private function txtCDCtrl_cpl() : void
      {
      }
      
      public function breath_cb(param1:Array) : void
      {
         if(canResearch && this.service.infoRes.curreshitem == 0)
         {
            this.btn_get.filters = param1;
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_get === _loc4_)
         {
            _loc3_ = LocaleMgr.ins.getStr(40750127,[familyStcVo.cost,LocaleMgr.ins.getStr(1200 + familyStcVo.techtype),vo.familytechlevel + 1]);
            AlertUtil.comfirm(_loc3_,server_familyTechResearch,null,"GUILD_TEACH_RESEARCH");
         }
      }
      
      public function server_familyTechResearch() : void
      {
         var _loc1_:FamilyTechResearchReq = new FamilyTechResearchReq();
         _loc1_.techtype = familyStcVo.techtype;
         ServerEngine.ins.send(7402,_loc1_,server_techResearch_cpl);
      }
      
      private function server_techResearch_cpl(param1:FamilyTechResearchRes, param2:ServerEvent) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000431));
         service.researchStart(this.vo,param1.lastresearchtime,param1.newassets);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
