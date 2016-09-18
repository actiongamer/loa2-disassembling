package nslm2.modules.funnies.newYears.day51s.panels
{
   import game.ui.newYears.day51s.panels.Day51RankPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import nslm2.modules.funnies.funnyCommons.IInitView;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.globals.GlobalSetting;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import morn.core.components.Box;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import proto.StaticMineSweepRankRewardModel;
   import morn.core.utils.StringUtils;
   
   public class Day51RankPanel extends Day51RankPanelUI implements IViewStackPage, IFuncIdView, IInitView
   {
      
      public static const GET_SERVER_ING:String = "Day51RankPanel.GET_SERVER_ING";
       
      
      private var _funcId:int;
      
      public function Day51RankPanel()
      {
         super();
      }
      
      public function get funcId() : int
      {
         return _funcId;
      }
      
      public function set funcId(param1:int) : void
      {
         _funcId = param1;
      }
      
      public function get getOpenTimeId_funny() : int
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               return DragonBoatService.ins.timeKind_funny;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return 15;
            case 10:
               return TowerService.ins.timeKind_funny;
         }
      }
      
      public function get getOpenTimeId() : int
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               return DragonBoatService.ins.timeKind_all;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return 16;
            case 10:
               return TowerService.ins.timeKind_all;
         }
      }
      
      public function get myScore() : int
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               return DragonBoatService.ins.infoRes.panel.myScore;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return this.service_day51.infoRes.panel.myScore;
            case 10:
               return TowerService.ins.myScore;
         }
      }
      
      public function get rankModelArr() : Array
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               return DragonBoatService.ins.stcModel.rankModelArr;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return this.service_day51.rankModelArr;
            case 10:
               return TowerService.ins.stcModel.rankModelArr;
         }
      }
      
      public function get rankMinScore() : int
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               return DefindConsts.MINE_SWEEP_RANK_MIN_SCORE;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return DefindConsts.MINE_SWEEP_RANK_MIN_SCORE;
            case 10:
               return DefindConsts.MINE_SWEEP_RANK_MIN_SCORE;
         }
      }
      
      public function do_server_getRankTable() : void
      {
         switch(int(funcId) - 13376)
         {
            case 0:
               DragonBoatService.ins.protos.server_DRAGON_BOAT_RANK_TABLE(server_getRankTable_cpl);
               return;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               this.service_day51.server_getRankTable(server_getRankTable_cpl);
               return;
            case 10:
               TowerService.ins.protos.server_TOWER_RANK(server_getRankTable_cpl);
               return;
         }
      }
      
      public function init() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         switch(int(funcId) - 13376)
         {
            case 0:
               if(GlobalSetting.showAvatar)
               {
                  this.img_avatar.skin = "png.uiDragonBoat.img_avatar";
               }
               else
               {
                  this.img_avatar.visible = false;
               }
               _loc4_ = DefindConsts.MINE_SWEEP_NEED_SCORE;
               break;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               this.img_avatar.skin = "png.uiDay51.img_avatar";
               _loc4_ = DefindConsts.MINE_SWEEP_NEED_SCORE;
               break;
            case 10:
               this.img_avatar.skin = "png.uiTower.img_avatar";
               this.img_avatar.y = this.img_avatar.y + 52;
               _loc4_ = DefindConsts.TOWER_NEED_SCORE;
         }
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(this.getOpenTimeId_funny);
         if(_loc1_)
         {
            this.txt_cd.text = LocaleMgr.ins.getStr(50600046) + TimeUtils.ymdhisCN(_loc1_.startTm) + " - " + TimeUtils.ymdhisCN(_loc1_.endTm);
         }
         this.list_gift.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         this.txt_list_title_lv.text = LocaleMgr.ins.getStr(60800016);
         this.txt_list_title_score.text = LocaleMgr.ins.getStr(60800017);
         this.txt_list_title_reward.text = LocaleMgr.ins.getStr(60800018);
         this.txt_list_title_reward_super.text = LocaleMgr.ins.getStr(60800019,[_loc4_]);
         this.txt_tip1.text = LocaleMgr.ins.getStr(60800026);
         var _loc2_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(this.getOpenTimeId_funny);
         if(_loc2_)
         {
            _loc3_ = "";
            if(_loc2_)
            {
               _loc3_ = TimeUtils.ymdCN(_loc2_.endTm);
            }
            this.txt_tip2.text = LocaleMgr.ins.getStr(60800015,[this.rankMinScore]) + "  " + LocaleMgr.ins.getStr(60800029,[_loc3_]);
         }
         this.list_gift.createCellHandler = list_createCellHandler;
      }
      
      private function list_createCellHandler(param1:Box) : void
      {
         (param1 as IFuncIdView).funcId = this.funcId;
      }
      
      public function get service_day51() : Day51Service
      {
         return Day51Service.ins;
      }
      
      public function viewStackIn() : void
      {
         this.setVisibleList("Day51RankPanel.GET_SERVER_ING",false);
         this.visible = true;
         this.do_server_getRankTable();
      }
      
      private function server_getRankTable_cpl() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc2_:int = this.rankModelArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.rankModelArr[_loc4_];
            if(StringUtils.isNull(_loc3_.reward) == false)
            {
               _loc1_.push(_loc3_);
            }
            _loc4_++;
         }
         this.list_gift.array = _loc1_;
         this.setVisibleList("Day51RankPanel.GET_SERVER_ING",true);
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function refreshUI() : void
      {
         this.txt_tree_lv.text = LocaleMgr.ins.getStr(13350007) + ":" + this.myScore;
      }
   }
}
