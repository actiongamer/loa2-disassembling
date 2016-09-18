package nslm2.modules.funnies.newYears.day38s.services
{
   import flash.events.EventDispatcher;
   import proto.GoddessVotePanelRes;
   import proto.GoddessScorePanelRes;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.StaticGoddesAwardModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.nets.sockets.ServerEvent;
   import flash.events.Event;
   import proto.GoddessVoteReq;
   import proto.GoddessVoteRes;
   import com.mz.core.utils.ArrayUtil;
   import proto.GoddessVotePanelRes.GoddessTicket;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGoddessScoreRewardVo;
   import proto.GoddessGetScoreRewardReq;
   import nslm2.utils.WealthUtil;
   
   public class Day38Service extends EventDispatcher
   {
      
      public static const EVT_INIT_CPL:String = "EVT_INIT_CPL";
      
      public static const EVT_SCORE_CPL:String = "EVT_SCORE_CPL";
      
      public static const EVT_VOTE_CPL:String = "EVT_VOTE_CPL";
      
      public static const EVT_GIFT_GET_CPL:String = "EVT_GIFT_GET_CPL";
      
      private static var _ins:nslm2.modules.funnies.newYears.day38s.services.Day38Service;
       
      
      public const heroIds:Array = [28000,30000,34000,38000,22000,18000,13000,12000,1400,25000];
      
      public const stcItemId_need:int = 83110;
      
      public var stcItemId_reward:Array;
      
      public var panelRes:GoddessVotePanelRes;
      
      public var scorePanelRes:GoddessScorePanelRes;
      
      private var getScoreRewardId:int;
      
      public function Day38Service()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.newYears.day38s.services.Day38Service
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.newYears.day38s.services.Day38Service();
         }
         return _ins;
      }
      
      public function countNpcFuncCount_vote() : void
      {
         if(this.panelRes.myTickets >= DefindConsts.GODDESS_SEND)
         {
            NpcFuncService.ins.changeCount(13334,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(13334,0);
         }
         stcItemId_reward = panelRes.dropInfo;
         this.countNpcFuncCount_main();
      }
      
      public function countNpcFuncCount_score() : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = this.scorePanelRes.rankAward;
         var _loc3_:Boolean = false;
         var _loc4_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc5_];
            if(_loc2_.score <= this.scorePanelRes.myScore)
            {
               if(this.scorePanelRes.scoreId.indexOf(_loc2_.id) == -1)
               {
                  _loc3_ = true;
                  break;
               }
            }
            _loc5_++;
         }
         if(_loc3_)
         {
            NpcFuncService.ins.changeCount(13335,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(13335,0);
         }
         this.countNpcFuncCount_main();
      }
      
      public function countNpcFuncCount_main() : void
      {
         if(NpcFuncService.ins.getVo(13334).count > 0 || NpcFuncService.ins.getVo(13335).count > 0)
         {
            NpcFuncService.ins.changeCount(13333,1);
         }
         else
         {
            NpcFuncService.ins.changeCount(13333,0);
         }
      }
      
      public function init() : void
      {
         ServerEngine.ins.send(6259,null,server_votePanel_cpl);
      }
      
      private function server_votePanel_cpl(param1:GoddessVotePanelRes, param2:ServerEvent) : void
      {
         this.panelRes = param1;
         countNpcFuncCount_vote();
         this.dispatchEvent(new Event("EVT_INIT_CPL"));
      }
      
      public function server_getScorePanel() : void
      {
         ServerEngine.ins.send(6262,null,server_scorePanel_cpl);
      }
      
      private function server_scorePanel_cpl(param1:GoddessScorePanelRes, param2:ServerEvent) : void
      {
         this.scorePanelRes = param1;
         countNpcFuncCount_score();
         this.dispatchEvent(new Event("EVT_SCORE_CPL"));
      }
      
      public function server_goddessVote(param1:uint, param2:uint) : void
      {
         var _loc3_:GoddessVoteReq = new GoddessVoteReq();
         _loc3_.goddessId = param1;
         _loc3_.ticketNum = param2;
         ServerEngine.ins.send(6260,_loc3_,server_goddessVote_cpl);
      }
      
      private function server_goddessVote_cpl(param1:GoddessVoteRes, param2:ServerEvent) : void
      {
         checkNewScore(this.panelRes.myScore,param1.myScore);
         this.panelRes.myScore = param1.myScore;
         var _loc3_:GoddessTicket = ArrayUtil.findByAttr(this.panelRes.tickets,GoddessTicket.ID.name,param1.goddessId) as GoddessTicket;
         _loc3_.tickets = param1.ticketNum;
         countNpcFuncCount_vote();
         FloatUtil.displayPlayerDataChange(param2.dataNotifyCacheVo);
         this.dispatchEvent(new Event("EVT_VOTE_CPL"));
      }
      
      private function checkNewScore(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:* = null;
         if(NpcFuncService.ins.getVo(13335).count == 0)
         {
            _loc3_ = StcMgr.ins.getGoddessScoreRewardTable().array;
            _loc3_.sortOn("id",16);
            _loc4_ = false;
            _loc6_ = _loc3_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc5_ = _loc3_[_loc7_];
               if(param1 < _loc5_.score && param2 >= _loc5_.score)
               {
                  _loc4_ = true;
                  break;
               }
               _loc7_++;
            }
            if(_loc4_)
            {
               NpcFuncService.ins.changeCount(13335,1);
               this.countNpcFuncCount_main();
            }
         }
      }
      
      public function server_goddessGetScoreReward(param1:uint) : void
      {
         var _loc2_:GoddessGetScoreRewardReq = new GoddessGetScoreRewardReq();
         getScoreRewardId = param1;
         _loc2_.id = param1;
         ServerEngine.ins.send(6263,_loc2_,server_scoreReward_cpl);
      }
      
      private function server_scoreReward_cpl(param1:*, param2:ServerEvent) : void
      {
         if(this.scorePanelRes.scoreId.indexOf(getScoreRewardId) == -1)
         {
            this.scorePanelRes.scoreId.push(getScoreRewardId);
         }
         var _loc3_:StaticGoddesAwardModel = this.scorePanelRes.rankAward[getScoreRewardId - 1];
         FloatUtil.showGetItemsDisplayPanel(WealthUtil.costStrToArr(_loc3_.reward));
         countNpcFuncCount_score();
         this.dispatchEvent(new Event("EVT_GIFT_GET_CPL"));
      }
   }
}
