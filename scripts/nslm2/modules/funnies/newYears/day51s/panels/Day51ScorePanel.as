package nslm2.modules.funnies.newYears.day51s.panels
{
   import game.ui.newYears.day51s.panels.Day51ScorePanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import nslm2.modules.funnies.funnyCommons.IInitView;
   import nslm2.modules.funnies.dials.consts.DialConsts;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Box;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import com.mz.core.utils.ArrayUtil;
   import proto.StaticMineSweepRankRewardModel;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.TimeUtils;
   
   public class Day51ScorePanel extends Day51ScorePanelUI implements IViewStackPage, IFuncIdView, IInitView
   {
       
      
      private var _funcId:int;
      
      private var maxScore:int;
      
      public function Day51ScorePanel()
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
      
      public function get getOpenTimeId() : int
      {
         var _loc1_:* = funcId;
         if(60810 !== _loc1_)
         {
            if(13386 !== _loc1_)
            {
               if(13376 !== _loc1_)
               {
                  return 16;
               }
               return DragonBoatService.ins.timeKind_all;
            }
            return TowerService.ins.timeKind_all;
         }
         return DialConsts.timeKind_all;
      }
      
      public function get myScore() : int
      {
         var _loc1_:* = funcId;
         if(60810 !== _loc1_)
         {
            if(13386 !== _loc1_)
            {
               if(13376 !== _loc1_)
               {
                  return this.service.infoRes.panel.myScore;
               }
               return DragonBoatService.ins.infoRes.panel.myScore;
            }
            return TowerService.ins.myScore;
         }
         return DialModel.getIns(60810).getMyScore();
      }
      
      public function init() : void
      {
         if(!(int(funcId) - 60810))
         {
            this.x = -30;
            this.y = 30;
         }
         var _loc1_:* = funcId;
         if(60810 !== _loc1_)
         {
            if(13386 !== _loc1_)
            {
               if(13376 !== _loc1_)
               {
                  this.img_avatar.skin = "png.uiDay51.img_avatar";
               }
               else
               {
                  this.img_avatar.skin = "png.uiDragonBoat.img_avatar";
               }
            }
            else
            {
               this.img_avatar.skin = "png.uiTower.img_avatar";
               this.img_avatar.y = this.img_avatar.y + 52;
            }
         }
         else
         {
            this.img_avatar.visible = false;
         }
         this.list_gift.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         this.txt_tip1.text = LocaleMgr.ins.getStr(60800026);
         this.txt_list_title_lv.text = LocaleMgr.ins.getStr(60800017);
         this.txt_list_title_reward.text = LocaleMgr.ins.getStr(13350015);
         this.txt_list_title_option.text = LocaleMgr.ins.getStr(13350016);
         this.list_gift.createCellHandler = list_createCellHandler;
      }
      
      private function list_createCellHandler(param1:Box) : void
      {
         (param1 as IFuncIdView).funcId = this.funcId;
      }
      
      public function get service() : Day51Service
      {
         return Day51Service.ins;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function refreshUI() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = funcId;
         if(60810 !== _loc5_)
         {
            if(13386 !== _loc5_)
            {
               if(13376 !== _loc5_)
               {
                  this.list_gift.array = ArrayUtil.vectorToArr(this.service.scoreModelArr);
               }
               else
               {
                  this.list_gift.array = ArrayUtil.vectorToArr(DragonBoatService.ins.stcModel.scoreModelArr);
               }
            }
            else
            {
               this.list_gift.array = ArrayUtil.vectorToArr(TowerService.ins.stcModel.scoreModelArr);
            }
         }
         else
         {
            this.list_gift.array = ArrayUtil.vectorToArr(DialModel.getIns(60810).scoreModelArr);
         }
         maxScore = 0;
         var _loc3_:int = this.list_gift.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.list_gift.array[_loc4_];
            maxScore = Math.max(this.maxScore,_loc2_.rank);
            _loc4_++;
         }
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(getOpenTimeId);
         if(_loc1_)
         {
            this.txt_cd.text = LocaleMgr.ins.getStr(50600046) + TimeUtils.ymdhisCN(_loc1_.startTm) + " - " + TimeUtils.ymdhisCN(_loc1_.endTm);
            this.txt_score.text = LocaleMgr.ins.getStr(13350007) + ":" + myScore;
            this.txt_score_progress.text = myScore + "/" + maxScore;
            this.progressBar.value = myScore / maxScore;
         }
      }
   }
}
