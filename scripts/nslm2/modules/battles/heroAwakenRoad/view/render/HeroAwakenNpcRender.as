package nslm2.modules.battles.heroAwakenRoad.view.render
{
   import game.ui.heroAwakenRoad.HeroAwakenNpcRenderUI;
   import com.mz.core.interFace.IObserver;
   import game.ui.heroAwakenRoad.HeroAwakenStarRenderUI;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagBossRender;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenNodeVo;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagBaseRender;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.StarUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.battles.heroAwakenRoad.service.HeroAwakenRoadService;
   import proto.JueRoadRecordRes;
   import nslm2.modules.Chapters.ShowStageInfoVo;
   import flash.geom.Point;
   import com.mz.core.event.MzEvent;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.handlers.Handler;
   import morn.core.components.Image;
   
   public class HeroAwakenNpcRender extends HeroAwakenNpcRenderUI implements IObserver
   {
      
      public static const SUMMARY_SINGLE_Y:int = 1;
      
      private static const BOSS_BOX_SUMMARY_Y:Number = -125;
      
      private static const BOSS_TREASURE_X:Number = 30;
      
      private static const BOSS_TITLE_Y:Number = -100;
       
      
      public var state:int;
      
      protected var starVec:Vector.<HeroAwakenStarRenderUI>;
      
      private var _dungeonFlagRender:DungeonFlagBossRender;
      
      private var _data:HeroAwakenNodeVo;
      
      public function HeroAwakenNpcRender()
      {
         super();
      }
      
      public function get ui() : DungeonFlagBaseRender
      {
         if(_dungeonFlagRender == null)
         {
            _dungeonFlagRender = new DungeonFlagBossRender(state,flagIconUrl);
         }
         return _dungeonFlagRender;
      }
      
      private function get vo() : StcConstellationVo
      {
         return _data.stcVo;
      }
      
      public function get flagIconUrl() : String
      {
         var _loc1_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(vo.npcgroup);
         if(_loc1_)
         {
            return UrlLib.headIcon(_loc1_.head_id.toString());
         }
         return null;
      }
      
      public function get model() : HeroAwakenRoadModel
      {
         return HeroAwakenRoadModel.ins;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         .super.dataSource = param1;
         _data = param1 as HeroAwakenNodeVo;
         if(_data)
         {
            state = _data.status;
            switchEventListeners(true);
            starVec = new <HeroAwakenStarRenderUI>[this.star0,this.star1,this.star2];
            changeState();
            this.addChild(this.ui);
            DisplayUtils.addChildFromGlobal(this.ui.box_flagAndIcon,this.box_star);
            validateOthers();
            validateDrops();
            _loc2_ = 0;
            while(_loc2_ < starVec.length)
            {
               (starVec[_loc2_] as HeroAwakenStarRenderUI).img_star.url = "png.uiHeroAwakenRoad.img_starS2";
               _loc2_++;
            }
            ObserverMgr.ins.regObserver(this);
         }
         this.txt_dungeonName.y = -100;
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
            default:
               showCanFight();
               break;
            case 2:
               showCanNotFight();
         }
         this.box_star.visible = true;
      }
      
      protected function showCanFight() : void
      {
      }
      
      protected function showCanNotFight() : void
      {
         this.box_star.visible = false;
      }
      
      protected function validateOthers() : void
      {
         setStar(StarUtil.starData(_data.gotStar,DefindConsts.STAR_MAX));
         this.txt_dungeonName.text = LocaleMgr.ins.getStr(this._data.stcVo.name);
         setTips();
      }
      
      protected function validateDrops() : void
      {
         var _loc1_:Array = WealthUtil.dropGroupIDToWealthVoArr(vo.drop_id);
         _loc1_.length = 1;
         this.list_drops.dataSource = _loc1_;
      }
      
      protected function setTips() : void
      {
         var _loc1_:StcConstellationPageVo = StcMgr.ins.getConstellationPageVo(_data.stcVo.map_id);
         this.ui.box_flag.toolTip = _loc1_.sort + "-" + _data.stcVo.sort + "  " + LocaleMgr.ins.getStr(_data.stcVo.name);
      }
      
      protected function setStar(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            (starVec[_loc2_] as HeroAwakenStarRender).img_star.url = "png.uiHeroAwakenRoad.img_starS2";
            starVec[_loc2_].dataSource = param1[_loc2_];
            _loc2_++;
         }
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         if(_data.status == 3)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40400029));
         }
         else
         {
            HeroAwakenRoadService.ins.server_jueRoadRecord(_data.stcVo.id,getRecordHanlder);
         }
      }
      
      private function getRecordHanlder(param1:JueRoadRecordRes) : void
      {
         model.addStageBtlGuideInfo(_data.id,param1);
         var _loc2_:ShowStageInfoVo = new ShowStageInfoVo();
         _loc2_.point = new Point(this.x,this.y - this.ui.img_flag.height / 2 * this.ui.img_flag.scale + 28);
         _loc2_.id = this._data.stcVo.id;
         _loc2_.data = this._data;
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
         else if(model.preStageId == this.vo.id && model.addStarCnt != 0)
         {
            _loc3_ = new Vector.<HeroAwakenStarRenderUI>();
            _loc4_ = 0;
            while(_loc4_ < model.addStarCnt)
            {
               _loc3_.push(starVec[_loc4_]);
               TweenLite.to(starVec[_loc4_].img_star,0.2,{
                  "scale":1.4,
                  "onComplete":starToColor,
                  "onCompleteParams":[starVec[_loc4_].img_star]
               });
               _loc4_++;
            }
            TimerManager.ins.doOnce(_loc3_.length * 100,new Handler(beginShowFly,[_loc3_]));
         }
      }
      
      protected function starToColor(param1:Image) : void
      {
         param1.filters = null;
         TweenLite.to(param1,0.2,{"scale":1});
      }
      
      protected function beginShowFly(param1:*) : void
      {
         setStar(StarUtil.starData(_data.gotStar,DefindConsts.STAR_MAX));
         ObserverMgr.ins.sendNotice("evtChapterStarGlobalPos",param1);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         super.dispose();
      }
   }
}
