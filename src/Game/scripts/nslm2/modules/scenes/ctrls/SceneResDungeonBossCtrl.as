package nslm2.modules.scenes.ctrls
{
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.scenes.mainCitys.ResChoose;
   import nslm2.modules.scenes.mainCitys.ResBossSelectPanel;
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import nslm2.modules.scenes.commons.SceneBoss3D;
   import flash.geom.Point;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.consts.StcNpcGroupConsts;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
   import proto.HeroPracticeFightStartReq;
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeNanduVo;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.common.globals.GlobalRef;
   import proto.HeroPracticeFightStartRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarBackMsg;
   import nslm2.modules.battles.resourceDungeons.ResourceDungeonShowVo;
   import proto.HeroPracticeTypeNodeInfo;
   import proto.HeroPracticeInfoRes;
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeTypeVo;
   import nslm2.modules.scenes.mainCitys.ResCell;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.core.managers.timerMgrs.TimerManager;
   import away3d.events.AnimatorEvent;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DWinActionCtrl;
   import flash.events.Event;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import away3d.events.MouseEvent3D;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.common.compsEffects.SummaryZoomInEffCtrl2;
   import game.ui.resourceDg.ResTalkUI;
   import morn.core.utils.StringUtils;
   import nslm2.utils.TransformUtil;
   import flash.geom.Vector3D;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.utils.Effect3DUtils;
   
   public class SceneResDungeonBossCtrl extends SceneNpcCtrlBase implements IObserver
   {
       
      
      public var _resChoose:ResChoose;
      
      public var _resBossSelect:ResBossSelectPanel;
      
      public var boss:SceneBoss3D;
      
      private var bossInitXY:Point;
      
      private var curStcResDgVo:StcHeropracticeNanduVo;
      
      private var _currBossVo;
      
      private var szc:SummaryZoomInEffCtrl2;
      
      private var talkBox:ResTalkUI;
      
      private var _say:Array;
      
      public function SceneResDungeonBossCtrl()
      {
         super();
         autoRo = false;
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(13000)).exec();
      }
      
      public function get resChoose() : ResChoose
      {
         if(!_resChoose)
         {
            _resChoose = new ResChoose();
         }
         return _resChoose;
      }
      
      public function get resBossSelect() : ResBossSelectPanel
      {
         if(!_resBossSelect)
         {
            _resBossSelect = new ResBossSelectPanel();
         }
         return _resBossSelect;
      }
      
      public function get playerHero() : SceneUnit3D
      {
         return scene.playerHero;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         var _loc2_:* = null;
         super.init(param1);
         if(this.npcRelationId)
         {
            _loc2_ = StcMgr.ins.getStageNpcRelationVo(npcRelationId);
            this.bossInitXY = StcNpcGroupConsts.positionToPoi2(_loc2_.position);
         }
         NpcFuncRef.ins.regFuncHandler(41400,this.npcFuncListHandler);
      }
      
      private function fightBoss(param1:*) : void
      {
         var _loc2_:HeroPracticeFightStartReq = new HeroPracticeFightStartReq();
         _loc2_.nanduid = StcHeropracticeNanduVo(param1.stc).id;
         _loc2_.typeid = StcHeropracticeNanduVo(param1.stc).type1;
         curStcResDgVo = param1.stc;
         ServerEngine.ins.send(7203,_loc2_,server_zhaohuan);
         GlobalRef.mainCityReshowParam.showResDgId = resBossSelect.currTypeVo.id;
      }
      
      private function server_zhaohuan(param1:HeroPracticeFightStartRes) : void
      {
         ModuleMgr.ins.staticLayer.switchVisible("ResourceDungeon",true);
         ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(40500,this.back,null));
         ModuleMgr.ins.showModule(41400,new ResourceDungeonShowVo(curStcResDgVo,param1));
      }
      
      private function npcFuncListHandler(param1:int) : void
      {
         ServerEngine.ins.send(7201,null,server_info_return);
      }
      
      private function getSerVo(param1:Array, param2:int) : HeroPracticeTypeNodeInfo
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.id == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function server_info_return(param1:HeroPracticeInfoRes) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         this.switchEventListeners(true);
         var _loc3_:Array = StcMgr.ins.getHeropracticeTypeTable().array;
         _loc3_.sortOn("sort");
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc5_];
            _loc4_ = resChoose["cell" + _loc5_];
            _loc4_.init(_loc2_,getSerVo(param1.infos,_loc2_.id));
            _loc5_++;
         }
         moveCamera();
         if(GlobalRef.mainCityReshowParam.showResDgId)
         {
            gotoRes(StcMgr.ins.getHeropracticeTypeVo(GlobalRef.mainCityReshowParam.showResDgId));
            GlobalRef.mainCityReshowParam.showResDgId = 0;
         }
      }
      
      private function moveCamera() : void
      {
         scene.isNpcFuncModel = true;
         ModuleMgr.ins.popLayer.closeAll();
         this.selectBossList_fadeIn();
         ModuleMgr.ins.staticLayer.switchVisible("ResourceDungeon",false,[10430,10400,10500]);
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.ResDg_moduleIdArr,[],true));
         scene.tweenMoveCtrl.exec(new Point(bossInitXY.x,bossInitXY.y),1);
      }
      
      public function bossFadeIn(param1:int, param2:Number = 0) : void
      {
         if(boss)
         {
            boss.fadeOut();
            setSummaryView();
            disposeBoss();
         }
         boss = new SceneBoss3D(scene.avatarLayer,param2);
         boss.shakeLayer3D = scene.layer3D;
         boss.rotation = -45;
         boss.pos2d = bossInitXY;
         boss.initByStcNpcId(param1);
         boss.avatarScallAll = DefindConsts.SCENE_AVATAR_SCALE_RES_DG_BOSS;
         TimerManager.ins.doLoop(8000,doWinAct);
      }
      
      private function onAnimatorComplete(param1:AnimatorEvent) : void
      {
         boss.avatar.removeEventListener("animator_complete",onAnimatorComplete);
         boss.action = "std_3";
      }
      
      private function doWinAct() : void
      {
         boss.avatar.addEventListener("animator_complete",onAnimatorComplete);
      }
      
      private function disposeBoss() : void
      {
         TimerManager.ins.clearTimer(doWinAct);
         boss.avatar.removeEventListener("animator_complete",onAnimatorComplete);
         boss.removeEventListener("mouseOver3d",onMonsterOver);
         boss.removeEventListener("mouseOut3d",onMonsterOver);
         boss.removeEventListener("unitMouseClick",onMonsterClicked);
         boss.dispose();
         boss = null;
      }
      
      protected function onMonsterClicked(param1:Event) : void
      {
         if(_currBossVo && _currBossVo.canFight)
         {
            fightBoss(_currBossVo);
         }
      }
      
      public function selectBossList_fadeIn() : void
      {
         ObserverMgr.ins.sendNotice("main_tool_bar_back_add",new MainToolBarBackMsg(40500,this.back,null));
         ModuleMgr.ins.staticLayer.addChild(resChoose);
         resChoose.centerX = 0;
         resChoose.centerY = 0;
         resChoose.fadeIn();
      }
      
      protected function gotoRes(param1:StcHeropracticeTypeVo) : void
      {
         resChoose.fadeOut();
         DisplayUtils.removeSelf(resChoose);
         ModuleMgr.ins.staticLayer.addChild(this.resBossSelect);
         resBossSelect.centerY = 0;
         this.resBossSelect.fadeIn();
         this.resBossSelect.init(param1);
         scene.tweenMoveCtrl.exec(new Point(bossInitXY.x,bossInitXY.y - 100),1.2);
      }
      
      private function back() : void
      {
         if(resChoose && resChoose.parent)
         {
            resChoose_close();
         }
         else
         {
            selectBoss_close();
         }
      }
      
      private function bossModelIn(param1:*) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc4_:int = StcMgr.ins.getNpcGroupVo(param1.stc.npcgroup).display_npc;
         bossFadeIn(_loc4_,0);
         setSummaryView(param1.stc.bosssay);
         _currBossVo = param1;
         if(_currBossVo.canFight)
         {
            switchBossCursor(true);
         }
         if(boss)
         {
            _loc3_ = StcMgr.ins.getNpcGroupVo(param1.stc.npcgroup);
            _loc5_ = LocaleMgr.ins.getStr(_loc3_.name);
            _loc2_ = (param1.stc.sort - 1) % 3 + 2;
            boss.tag3DVBox.initName(_loc5_,ColorLib.qualityColor(_loc2_),16);
            boss.tag3DVBox.scaleAll = 0.833333333333333;
         }
      }
      
      private function onMonsterOver(param1:MouseEvent3D) : void
      {
         if(param1.type == "mouseOver3d")
         {
            MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
         }
         else if(param1.type == "mouseOut3d")
         {
            MouseIconManager.ins.hideSpecialMouseCursor();
         }
      }
      
      private function resChoose_close(... rest) : void
      {
         this.switchEventListeners(false);
         ModuleMgr.ins.staticLayer.switchVisible("ResourceDungeon",true);
         ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(40500,this.back,null));
         this.unactived();
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.MainCity_moduleIdArr,MainToolBarChangeMsg.MainCity_moduleIdArrVertical,false));
      }
      
      public function unactived() : void
      {
         if(this.scene.isNpcFuncModel)
         {
            if(boss)
            {
               boss.fadeOut();
               setSummaryView();
               disposeBoss();
            }
            curStcResDgVo = null;
            scene.isNpcFuncModel = false;
            selectBossList_fadeOut();
         }
         else
         {
            selectBossList_fadeOut();
         }
         scene.tweenMoveCtrl.exec(playerHero.pos2d,1,0.6);
      }
      
      public function selectBossList_fadeOut() : void
      {
         resChoose.fadeOut();
         DisplayUtils.removeSelf(resChoose);
      }
      
      private function closeFunc() : void
      {
         resChoose_close(null);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
            resChoose.btn_close_2.clickHandler = closeFunc;
            resBossSelect.addEventListener("close",selectBoss_close);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
            resChoose.btn_close_2.clickHandler = null;
            resBossSelect.removeEventListener("close",selectBoss_close);
         }
      }
      
      protected function selectBoss_close(param1:Event = null) : void
      {
         scene.tweenMoveCtrl.exec(new Point(bossInitXY.x,bossInitXY.y),1);
         if(boss)
         {
            boss.fadeOut();
            setSummaryView();
            disposeBoss();
         }
         resBossSelect.fadeOut();
         ModuleMgr.ins.staticLayer.addChild(resChoose);
         resChoose.fadeIn();
         ServerEngine.ins.send(7201,null,refresh_res_choose);
      }
      
      private function refresh_res_choose(param1:HeroPracticeInfoRes) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:Array = StcMgr.ins.getHeropracticeTypeTable().array;
         _loc3_.sortOn("sort");
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc5_];
            _loc4_ = resChoose["cell" + _loc5_];
            _loc4_.init(_loc2_,getSerVo(param1.infos,_loc2_.id));
            _loc5_++;
         }
      }
      
      override public function dispose() : void
      {
         this.switchEventListeners(false);
         NpcFuncRef.ins.unregFuncHandler(41400,this.npcFuncListHandler);
         if(this.npc)
         {
            this.npc.dispose();
            this.npc = null;
         }
         if(boss)
         {
            disposeBoss();
         }
         if(szc)
         {
            szc.dispose();
         }
         DisplayUtils.removeSelf(resChoose);
         resChoose.dispose();
         DisplayUtils.removeSelf(resBossSelect);
         resBossSelect.dispose();
         _resChoose = null;
         _resBossSelect = null;
         ModuleMgr.ins.staticLayer.switchVisible("ResourceDungeon",true);
         ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(40500,this.back,null));
         super.dispose();
      }
      
      protected function setSummaryView(param1:String = null) : void
      {
         var _loc2_:* = null;
         if(szc)
         {
            szc.dispose();
         }
         if(!StringUtils.isNull(param1))
         {
            _say = param1.split("|");
            _loc2_ = _say[int(_say.length * Math.random())];
            if(talkBox == null)
            {
               talkBox = new ResTalkUI();
               this.scene.addChild(talkBox);
            }
            this.talkBox.visible = true;
            talkBox.txt_summary.text = LocaleMgr.ins.getStr(_loc2_);
            szc = new SummaryZoomInEffCtrl2(this.talkBox.bg,2,5,hideHandler,showHandler);
         }
         else
         {
            this.talkBox.visible = false;
         }
      }
      
      private function showHandler() : void
      {
         var _loc1_:Vector3D = TransformUtil.stage3Dto2D(boss.tag3DVBox.scenePosition,scene);
         this.talkBox.x = _loc1_.x;
         this.talkBox.y = _loc1_.y;
      }
      
      private function hideHandler() : void
      {
         var _loc1_:String = _say[int(_say.length * Math.random())];
         talkBox.txt_summary.text = LocaleMgr.ins.getStr(_loc1_);
      }
      
      override public function getFocusNotices() : Array
      {
         return ["RES_DG_SELECT_ONE_RES","RES_DG_SELECT_ONE_BOSS","RES_DG_FIGHT","RES_DG_SWITCH_BOSS_FIGHT_CURSOR"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("RES_DG_SELECT_ONE_RES" !== _loc3_)
         {
            if("RES_DG_SELECT_ONE_BOSS" !== _loc3_)
            {
               if("RES_DG_FIGHT" !== _loc3_)
               {
                  if("RES_DG_SWITCH_BOSS_FIGHT_CURSOR" === _loc3_)
                  {
                     switchBossCursor(param2);
                  }
               }
               else
               {
                  fightBoss(param2);
               }
            }
            else
            {
               this.bossModelIn(param2);
            }
         }
         else
         {
            gotoRes(param2);
         }
      }
      
      private function switchBossCursor(param1:Boolean) : void
      {
         if(param1)
         {
            boss.addEventListener("unitMouseClick",onMonsterClicked);
            boss.addEventListener("mouseOver3d",onMonsterOver);
            boss.addEventListener("mouseOut3d",onMonsterOver);
         }
         else
         {
            boss.removeEventListener("unitMouseClick",onMonsterClicked);
            boss.removeEventListener("mouseOver3d",onMonsterOver);
            boss.removeEventListener("mouseOut3d",onMonsterOver);
         }
      }
   }
}
