package nslm2.modules.funnies.guilds.guildTechs
{
   import game.ui.guildTechs.GuildTechRenderUI;
   import proto.FamilyTechItem;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyTechCostVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import proto.FamilyTechStudyReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyTechStudyRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import morn.customs.expands.MornExpandUtil;
   
   public class GuildTechRender extends GuildTechRenderUI
   {
       
      
      public var nextStcVo:StcFamilyTechCostVo;
      
      private var curStcVo:StcFamilyTechCostVo;
      
      private var _vo:FamilyTechItem;
      
      public var canStudy:Boolean;
      
      public function GuildTechRender()
      {
         super();
         this.btn_study.label = LocaleMgr.ins.getStr(999000420);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
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
         this.refresh(false);
      }
      
      private function refresh(param1:Boolean = true) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         if(_vo)
         {
            nextStcVo = GuildTechService.findStcVoByTechtypeAndRank(vo.techtype,vo.memberlevel + 1);
            curStcVo = GuildTechService.findStcVoByTechtypeAndRank(vo.techtype,vo.memberlevel);
            _loc4_ = nextStcVo || curStcVo;
            _loc2_ = LocaleMgr.ins.getStr(1200 + _loc4_.techtype);
            this.txt_typeName.text = _loc2_;
            this.img_icon.url = UrlLib.propS2(1);
            this.txt_level.text = LocaleMgr.ins.getStr(999000421) + vo.memberlevel + "/" + vo.familytechlevel;
            if(vo.memberlevel >= vo.familytechlevel)
            {
               this.btn_study.filters = null;
            }
            this.renderEffectUI.visible = vo.memberlevel > 0;
            this.txt_effect.visible = vo.memberlevel == 0;
            if(vo.memberlevel > 0)
            {
               _loc7_ = NpcPropVo.parseStr(curStcVo.effect);
               _loc7_.preFix = "+";
               if(param1)
               {
                  _loc7_.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
               }
            }
            else
            {
               _loc7_ = NpcPropVo.parseStr(nextStcVo.effect);
               _loc7_.preFix = "+";
               txt_effect.text = LocaleMgr.ins.getStr(40750133);
            }
            this.renderEffectUI.dataSource = _loc7_;
            if(nextStcVo)
            {
               _loc5_ = NpcPropVo.parseStr(nextStcVo.effect);
               this.btn_study.toolTip = LocaleMgr.ins.getStr(999000422) + _loc2_ + " +" + _loc5_.value;
            }
            this.btn_study.disabled = !nextStcVo;
            this.renderNeed.visible = nextStcVo;
            canStudy = false;
            if(nextStcVo)
            {
               _loc6_ = PlayerModel.ins.getCountByWealthVo(WealthUtil.createWealthVo(6));
               _loc3_ = WealthUtil.parseCostStr(curStcVo.personcost);
               if(_loc6_ >= int(_loc3_.count))
               {
                  canStudy = true;
               }
               this.renderNeed.dataSource = _loc3_;
            }
            else
            {
               this.renderNeed.visible = false;
            }
         }
      }
      
      public function breath_cb(param1:Array) : void
      {
         if(_vo && vo.memberlevel < vo.familytechlevel && canStudy)
         {
            this.btn_study.filters = param1;
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = param1;
         if(this.btn_study === _loc5_)
         {
            _loc4_ = PlayerModel.ins.getCountByWealthVo(WealthUtil.createWealthVo(6));
            _loc3_ = WealthUtil.parseCostStr(curStcVo.personcost);
            if(_loc4_ >= int(_loc3_.count))
            {
               server_familyTechStudy();
            }
            else
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(1006),ModuleMgr.ins.popLayer.curModuleId);
            }
         }
      }
      
      public function get service() : GuildTechService
      {
         return GuildTechService.ins;
      }
      
      public function server_familyTechStudy() : void
      {
         var _loc1_:FamilyTechStudyReq = new FamilyTechStudyReq();
         _loc1_.techtype = nextStcVo.techtype;
         ServerEngine.ins.send(7403,_loc1_,server_techStudy_cpl);
      }
      
      private function server_techStudy_cpl(param1:FamilyTechStudyRes, param2:ServerEvent) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         AlertUtil.float(LocaleMgr.ins.getStr(999000423));
         var _loc4_:StcFamilyTechCostVo = GuildTechService.findStcVoByTechtypeAndRank(vo.techtype,param1.newlevel);
         if(_loc4_)
         {
            _loc3_ = LocaleMgr.ins.getStr(2000 + _loc4_.techtype);
            _loc5_ = NpcPropVo.parseStr(_loc4_.effect);
            AlertUtil.float(LocaleMgr.ins.getStr(999000424) + _loc3_ + " +" + _loc5_.value);
            vo.itemid = _loc4_.id;
            vo.memberlevel = param1.newlevel;
            GuildModel.ins.con = int(param1.remaincon);
            this.refresh();
            service.studyCpl(this.vo);
         }
      }
   }
}
