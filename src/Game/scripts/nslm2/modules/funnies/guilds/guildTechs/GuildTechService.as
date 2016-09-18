package nslm2.modules.funnies.guilds.guildTechs
{
   import flash.events.EventDispatcher;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyTechCostVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.FamilyTechInfoRes;
   import proto.FamilyTechInfoReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.nets.sockets.ServerEvent;
   import proto.FamilyTechItem;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.FamilyTechResearchNotify;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.ArrayUtil;
   
   public class GuildTechService extends EventDispatcher
   {
      
      public static const INIF_INFO_CPL:String = "INIF_INFO_CPL";
      
      public static const RESEARCH_START:String = "RESEARCH_START";
      
      public static const RESEARCH_CPL:String = "RESEARCH_CPL";
      
      public static const STUDY_CPL:String = "STUDY_CPL";
      
      private static var _ins:nslm2.modules.funnies.guilds.guildTechs.GuildTechService;
       
      
      public var infoRes:FamilyTechInfoRes;
      
      private var _curReshStcVo:StcFamilyTechCostVo;
      
      public function GuildTechService()
      {
         super();
         ServerEngine.ins.addAlwayHandler(7404,server_techResearch_cpl);
      }
      
      public static function get ins() : nslm2.modules.funnies.guilds.guildTechs.GuildTechService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.guilds.guildTechs.GuildTechService();
         }
         return _ins;
      }
      
      public static function findStcVoByTechtypeAndRank(param1:int, param2:int) : StcFamilyTechCostVo
      {
         return StcMgr.ins.getVoByMultiColumnValue("static_family_tech_cost",["techtype","rank"],[param1,param2]);
      }
      
      public function initInfo() : void
      {
         var _loc1_:FamilyTechInfoReq = new FamilyTechInfoReq();
         ServerEngine.ins.send(7401,_loc1_,server_techInfo_cpl);
      }
      
      private function server_techInfo_cpl(param1:FamilyTechInfoRes, param2:ServerEvent) : void
      {
         param1.items.sortOn(FamilyTechItem.TECHTYPE.name,16);
         this.infoRes = param1;
         countTimes();
         this.dispatchEvent(new MzEvent("INIF_INFO_CPL"));
      }
      
      public function get curReshStcVo() : StcFamilyTechCostVo
      {
         if(_curReshStcVo != null)
         {
            if(_curReshStcVo.id == this.infoRes.curreshitem)
            {
               return _curReshStcVo;
            }
         }
         if(this.infoRes.curreshitem)
         {
            _curReshStcVo = StcMgr.ins.getFamilyTechCostVo(this.infoRes.curreshitem);
            return _curReshStcVo;
         }
         return null;
      }
      
      public function researchStart(param1:FamilyTechItem, param2:int, param3:int) : void
      {
         var _loc4_:* = null;
         if(GuildModel.ins.guildInfo)
         {
            GuildModel.ins.guildInfo.fund = param3;
            _loc4_ = StcMgr.ins.getFamilyTechCostVo(param1.itemid);
            this.infoRes.curreshitem = param1.itemid;
            this.infoRes.curreshlevel = param1.familytechlevel + 1;
            this.infoRes.lastreshtime = param2;
            this.dispatchEvent(new MzEvent("RESEARCH_START",param1));
            countTimes();
         }
      }
      
      public function studyCpl(param1:FamilyTechItem) : void
      {
         countTimes();
         this.dispatchEvent(new MzEvent("STUDY_CPL",param1));
      }
      
      private function countTimes() : void
      {
         var _loc11_:int = 0;
         var _loc3_:* = null;
         var _loc10_:* = null;
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc2_:Boolean = false;
         var _loc5_:Boolean = false;
         if(GuildModel.ins.isPresident() || GuildModel.ins.isVP())
         {
            if(this.infoRes.curreshitem == 0)
            {
               _loc2_ = true;
            }
         }
         var _loc7_:int = PlayerModel.ins.getCountByWealthVo(WealthUtil.createWealthVo(6));
         var _loc6_:int = 0;
         var _loc8_:int = this.infoRes.items.length;
         _loc11_ = 0;
         while(_loc11_ < _loc8_)
         {
            _loc3_ = this.infoRes.items[_loc11_];
            if(_loc3_.memberlevel < _loc3_.familytechlevel)
            {
               _loc10_ = nslm2.modules.funnies.guilds.guildTechs.GuildTechService.findStcVoByTechtypeAndRank(_loc3_.techtype,_loc3_.memberlevel);
               _loc1_ = WealthUtil.parseCostStr(_loc10_.personcost);
               if(_loc7_ >= _loc1_.count)
               {
                  _loc6_++;
               }
               if(_loc2_ && _loc5_ == false)
               {
                  if(_loc3_.familytechlevel < infoRes.highestlevel)
                  {
                     _loc4_ = nslm2.modules.funnies.guilds.guildTechs.GuildTechService.findStcVoByTechtypeAndRank(_loc3_.techtype,_loc3_.familytechlevel);
                     if(GuildModel.ins.guildInfo.fund >= _loc4_.cost)
                     {
                        _loc5_ = true;
                     }
                  }
               }
            }
            _loc11_++;
         }
         if(_loc5_)
         {
            _loc6_++;
         }
         var _loc9_:int = 0;
         if(NpcFuncService.ins.getVo(40750))
         {
            _loc9_ = NpcFuncService.ins.getVo(40750).count;
         }
         if(_loc9_ != _loc6_)
         {
            NpcFuncService.ins.changeCount(40750,_loc6_);
            ObserverMgr.ins.sendNotice("guild_notice_update_guild_info_panel");
         }
      }
      
      private function server_techResearch_cpl(param1:FamilyTechResearchNotify, param2:ServerEvent) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(infoRes)
         {
            if(param1.lastresearchtime == 0)
            {
               infoRes.curreshitem = 0;
               infoRes.curreshlevel = 0;
               AlertUtil.float(LocaleMgr.ins.getStr(1200 + param1.itemtype) + "Lv." + param1.itemlevel + LocaleMgr.ins.getStr(999000432));
               _loc4_ = findStcVoByTechtypeAndRank(param1.itemtype,param1.itemlevel);
               _loc3_ = ArrayUtil.findByAttr(infoRes.items,FamilyTechItem.TECHTYPE.name,param1.itemtype);
               _loc3_.familytechlevel = _loc4_.rank;
               this.dispatchEvent(new MzEvent("RESEARCH_CPL",_loc3_));
            }
            else
            {
               _loc3_ = ArrayUtil.findByAttr(infoRes.items,FamilyTechItem.TECHTYPE.name,param1.itemtype);
               researchStart(_loc3_,param1.lastresearchtime,param1.newassets);
            }
            countTimes();
         }
      }
   }
}
