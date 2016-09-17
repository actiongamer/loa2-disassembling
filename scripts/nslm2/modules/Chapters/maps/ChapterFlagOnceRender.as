package nslm2.modules.Chapters.maps
{
   import game.ui.chapters.ChapterFlagOnceRenderUI;
   import com.mz.core.interFace.IObserver;
   import game.ui.chapters.StarRenderUI;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagOnceRender;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagBaseRender;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.Chapters.ChapterModel;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.Chapters.DungeonTreasureCtrl;
   import nslm2.common.ui.components.comps2d.StarUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.StringUtils;
   import nslm2.common.compsEffects.SummaryZoomInEffCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.modules.Chapters.StarRender;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import proto.StageBtlGuideReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.StageBtlGuideRes;
   import nslm2.modules.Chapters.ShowStageInfoVo;
   import flash.geom.Point;
   import com.mz.core.event.MzEvent;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.handlers.Handler;
   import morn.core.components.Image;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   
   public class ChapterFlagOnceRender extends ChapterFlagOnceRenderUI implements IObserver
   {
      
      public static const SUMMARY_SINGLE_Y:int = 1;
       
      
      public var state:int;
      
      protected var starVec:Vector.<StarRenderUI>;
      
      private var dungeonFlagRender:DungeonFlagOnceRender;
      
      public var treasureCtrl:DungeonTreasureCtrl;
      
      public function ChapterFlagOnceRender(param1:int)
      {
         super();
         state = param1;
         ObserverMgr.ins.regObserver(this);
         this.treasureBoxS1.treasureType = 3;
      }
      
      public function get ui() : DungeonFlagBaseRender
      {
         if(dungeonFlagRender == null)
         {
            dungeonFlagRender = new DungeonFlagOnceRender(state,flagIconUrl);
         }
         return dungeonFlagRender;
      }
      
      public function get flagIconUrl() : String
      {
         var _loc1_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo((this.vo as StcStageVo).icon_id);
         if(_loc1_)
         {
            return UrlLib.headIcon(_loc1_.head_id.toString());
         }
         return null;
      }
      
      public function get model() : ChapterModel
      {
         return ChapterModel.ins;
      }
      
      public function get vo() : *
      {
         return dataSource as StcStageVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         switchEventListeners(true);
         starVec = new <StarRenderUI>[this.star0,this.star1,this.star2];
         changeState();
         this.addChild(this.ui);
         DisplayUtils.addChildFromGlobal(this.ui.box_flagAndIcon,this.box_summary);
         DisplayUtils.addChildFromGlobal(this.ui.box_flagAndIcon,this.box_star);
         validateOthers();
         validateSpe();
         validateDrops();
      }
      
      protected function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.ui.addEventListener("click",onClick);
         }
         else
         {
            this.ui.removeEventListener("click",onClick);
         }
      }
      
      protected function changeState() : void
      {
         switch(int(state) - 1)
         {
            case 0:
               showCanFight();
               break;
            case 1:
               showNowDungeon();
               break;
            case 2:
               showCanNotFight();
               break;
            case 3:
               showClear();
         }
      }
      
      protected function showCanFight() : void
      {
      }
      
      protected function showCanNotFight() : void
      {
         this.txt_dungeonName.visible = false;
      }
      
      protected function showClear() : void
      {
         this.txt_dungeonName.visible = false;
      }
      
      protected function showNowDungeon() : void
      {
      }
      
      protected function validateOthers() : void
      {
         setStar(StarUtil.starData(model.getPreStageInfoStar(vo.id),DefindConsts.STAR_MAX));
         this.txt_dungeonName.text = LocaleMgr.ins.getStr(this.vo.name);
         if(vo.box_prize == 0)
         {
            this.box_treasureBox.visible = false;
         }
         treasureCtrl = new DungeonTreasureCtrl(this.treasureBoxS1).setStageId(this.vo.id);
         this.parts.push(new DungeonTreasureCtrl(this.treasureBoxS1).setStageId(this.vo.id));
         setTips();
      }
      
      protected function validateSpe() : void
      {
         this.box_star.visible = false;
         this.box_summary.visible = false;
      }
      
      protected function validateDrops() : void
      {
         var _loc1_:* = null;
         if(vo.kind == 1)
         {
            this.box_drop.visible = false;
         }
         else
         {
            this.box_drop.visible = true;
            _loc1_ = ChapterModel.ins.getShowDropVoArr(vo.id);
            this.list_drops.dataSource = _loc1_;
            if(_loc1_.length == 1)
            {
               this.img_dropBg.skin = "png.uiChapter.dungeonMap.img_dropBgSingleLine";
            }
            if(_loc1_.length == 2)
            {
               this.img_dropBg.skin = "png.uiChapter.dungeonMap.img_dropBg";
            }
         }
      }
      
      protected function setSummaryView() : void
      {
         if(!StringUtils.isNull(this.vo.summary))
         {
            this.box_summary.visible = true;
            this.txt_summary.text = LocaleMgr.ins.getStr(this.vo.summary);
            setTxtSummary();
            if(this.txt_summary.textHeight > 45)
            {
               var _loc1_:* = -11 - this.txt_summary.textHeight + 40;
               this.txt_summary_bg.y = _loc1_;
               this.txt_summary.y = _loc1_;
               this.txt_summary_bg.height = 63 + this.txt_summary.textHeight - 40;
            }
            else
            {
               _loc1_ = -11;
               this.txt_summary_bg.y = _loc1_;
               this.txt_summary.y = _loc1_;
               this.txt_summary_bg.height = 63;
            }
            this.txt_dungeonName.visible = false;
            this.parts.push(new SummaryZoomInEffCtrl(this.box_summary,2,5,dungeonNameShow,dungeonNameHide));
         }
         else
         {
            this.box_summary.visible = false;
         }
      }
      
      protected function dungeonNameHide() : void
      {
         if(vo.kind != 1)
         {
            this.txt_dungeonName.visible = false;
         }
      }
      
      protected function dungeonNameShow() : void
      {
         if(vo.kind != 1)
         {
            this.txt_dungeonName.visible = true;
         }
      }
      
      protected function setTxtSummary() : void
      {
         if(this.txt_summary.text.length <= 12)
         {
            this.txt_summary.align = "center";
            this.txt_summary.y = 1;
         }
      }
      
      protected function setTips() : void
      {
         var _loc1_:StcStageVo = StcMgr.ins.getStageVo(this.vo.id);
         var _loc2_:StcChapterVo = StcMgr.ins.getChapterVo(_loc1_.chapter_id);
         this.ui.box_flag.toolTip = _loc2_.sort + "-" + _loc1_.sort + "  " + LocaleMgr.ins.getStr(_loc1_.name);
      }
      
      protected function setStar(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            (starVec[_loc2_] as StarRender).img_star.url = "png.uiChapter.dungeonMap.img_starS2";
            starVec[_loc2_].dataSource = param1[_loc2_];
            _loc2_++;
         }
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         if(this.model.cplIdArr.indexOf(vo.id) != -1)
         {
            if(this.vo.kind == 1)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(40400030));
               return;
            }
         }
         else if(this.model.nextId != vo.id)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40400029));
            return;
         }
         var _loc2_:StageBtlGuideReq = new StageBtlGuideReq();
         _loc2_.stageId = this.vo.id;
         ServerEngine.ins.send(6068,_loc2_,serverCplHandler_stageBtl);
      }
      
      protected function serverCplHandler_stageBtl(param1:StageBtlGuideRes) : void
      {
         ChapterModel.ins.addStageBtlGuideInfo(param1.stageId,param1);
         var _loc2_:ShowStageInfoVo = new ShowStageInfoVo();
         _loc2_.point = new Point(this.x,this.y - this.ui.img_flag.height / 2 * this.ui.img_flag.scale + 28);
         _loc2_.id = this.vo.id;
         this.dispatchEvent(new MzEvent("evtShowStageInfo",_loc2_,true));
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtChapterStarCntAdded","evtShowTargetStage"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:* = param1;
         if("evtChapterStarCntAdded" !== _loc5_)
         {
            if("evtShowTargetStage" === _loc5_)
            {
               if(param2 as int == this.vo.id)
               {
                  onClick(null);
               }
            }
         }
         else if(ChapterModel.ins.preStageId == this.vo.id && ChapterModel.ins.chapterStarCntAdd() != 0)
         {
            _loc3_ = new Vector.<StarRenderUI>();
            _loc4_ = ChapterModel.ins.getPreStageInfoStar(ChapterModel.ins.preStageId);
            while(_loc4_ <= ChapterModel.ins.getStageInfoStar(ChapterModel.ins.preStageId))
            {
               if(_loc4_ > 0)
               {
                  _loc3_.push(starVec[_loc4_ - 1]);
                  TweenLite.to(starVec[_loc4_ - 1].img_star,0.2,{
                     "scale":1.4,
                     "onComplete":starToColor,
                     "onCompleteParams":[starVec[_loc4_ - 1].img_star]
                  });
               }
               _loc4_++;
            }
            TimerManager.ins.doOnce(_loc3_.length * 100,new Handler(beginShowFly,[_loc3_]));
         }
      }
      
      protected function showTargetEffect() : void
      {
         var _loc1_:Image = new Image("png.uiNewerGuide.箭头");
         _loc1_.x = -31;
         _loc1_.y = -85;
         this.addChild(_loc1_);
         this.parts.push(new FloatUpDownEffCtrl().init(_loc1_));
      }
      
      protected function starToColor(param1:Image) : void
      {
         param1.filters = null;
         TweenLite.to(param1,0.2,{"scale":1});
      }
      
      protected function beginShowFly(param1:*) : void
      {
         setStar(StarUtil.starData(model.getStageInfoStar(vo.id),DefindConsts.STAR_MAX));
         ObserverMgr.ins.sendNotice("evtChapterStarGlobalPos",param1);
      }
      
      protected function get treasureBoxS1() : TreasureBoxBaseRender
      {
         return this.treasureBox as TreasureBoxBaseRender;
      }
      
      override public function dispose() : void
      {
         treasureCtrl = null;
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         super.dispose();
      }
   }
}
