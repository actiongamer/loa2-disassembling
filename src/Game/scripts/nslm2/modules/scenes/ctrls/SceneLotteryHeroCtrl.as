package nslm2.modules.scenes.ctrls
{
   import com.mz.core.interFace.IObserver;
   import flash.geom.Point;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.consts.StcNpcGroupConsts;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.utils.Effect3DUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.modules.battles.battle.FPUtil;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.TransformUtil;
   import flash.geom.Vector3D;
   import com.greensock.TweenLite;
   import com.mz.core.utils2.task.DelayTask;
   import com.mz.core.utils.MathUtil;
   import proto.HeroInfo;
   import com.mz.core.utils2.task.TaskBase;
   import morn.core.handlers.Handler;
   
   public class SceneLotteryHeroCtrl extends SceneNpcCtrlBase implements IObserver
   {
       
      
      public var func_pos2d:Point;
      
      public var func_pos2d_see:Point;
      
      private var rewardArr:Array;
      
      private var showResult_cpl;
      
      public var heroShowEffList:nslm2.modules.scenes.ctrls.LHHeroShowEffList;
      
      public var emCtrl:nslm2.modules.scenes.ctrls.Effect3DEmmiterCtrl;
      
      public var effLottering:SpecterEffect;
      
      public function SceneLotteryHeroCtrl()
      {
         super();
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         var _loc2_:StcStageNpcRelationVo = StcMgr.ins.getStageNpcRelationVo(this.npcRelationId);
         this.func_pos2d = StcNpcGroupConsts.positionToPoi2(_loc2_.position);
         func_pos2d_see = this.func_pos2d.add(new Point(0,-120));
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId);
         if(this.npc)
         {
            this.npc.addEventListener("unitMouseTrigger",npc_onMouse);
         }
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(12104)).exec();
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(12105)).exec();
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(12101)).exec();
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(12102)).exec();
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(12103)).exec();
         NpcFuncRef.ins.regFuncHandler(11900,this.actived);
      }
      
      override protected function runHandler() : void
      {
         super.runHandler();
         AlertUtil.comfirm(LocaleMgr.ins.getStr(999000516),this.actived);
      }
      
      public function actived() : void
      {
         this.scene.isNpcFuncModel = true;
         ModuleMgr.ins.popLayer.closeAll();
         switchOtherStaticModule(false);
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.LOTTERY_HERO_moduleIdArr,[],true,false));
         scene.tweenMoveCtrl.exec(func_pos2d_see,1,0.8,cameraMove_cpl);
      }
      
      private function cameraMove_cpl() : void
      {
         ModuleMgr.ins.showModule(11900,{"sceneCtrl":this});
      }
      
      private function switchOtherStaticModule(param1:Boolean) : void
      {
         ModuleMgr.ins.staticLayer.switchVisible("LotteryHero",param1,[11900,10430]);
      }
      
      public function switchEffPrepare(param1:Boolean) : void
      {
         if(param1)
         {
            if(effLottering == null)
            {
               showEffPrepare();
            }
         }
         else if(effLottering != null)
         {
            disposeEffPrepare();
         }
      }
      
      private function showEffPrepare() : void
      {
         this.scene.multiBgLayer.addMethod(FPUtil.getDarkMethod());
         effLottering = EffectManager.createEffect(Effect3DUtils.getUrlBySid(12104),true,this.scene.effLayer3D);
         var _loc1_:Vector3D = TransformUtil.tran2DTo3DByPoi(func_pos2d.add(new Point(0,35)));
         TransformUtil.scene45ChangeDeep(_loc1_,200);
         effLottering.position = _loc1_;
         effLottering.rotationX = -10;
         emCtrl = new nslm2.modules.scenes.ctrls.Effect3DEmmiterCtrl(effLottering,["glow","line","guanghuan","luoxuan"]);
      }
      
      private function disposeEffPrepare() : void
      {
         if(this.effLottering)
         {
            effLottering.dispose();
            effLottering = null;
         }
         if(emCtrl)
         {
            emCtrl.dispose();
            emCtrl = null;
         }
         this.scene.multiBgLayer.removeMethod(FPUtil.getDarkMethod());
      }
      
      public function showResult(param1:Array, param2:*) : void
      {
         disposeHeroShowEffList();
         this.rewardArr = param1;
         this.showResult_cpl = param2;
         if(effLottering == null)
         {
            showEffPrepare();
            TweenLite.delayedCall(0.3,this.lotteryOneByOne);
         }
         else
         {
            this.lotteryOneByOne();
         }
      }
      
      private function lotteryOneByOne() : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:* = null;
         var _loc4_:* = null;
         heroShowEffList = new nslm2.modules.scenes.ctrls.LHHeroShowEffList();
         heroShowEffList.addTask(new DelayTask(500));
         var _loc5_:int = this.rewardArr.length;
         if(_loc5_ > 1)
         {
            _loc3_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc3_.push(_loc6_);
               _loc6_++;
            }
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc2_ = _loc3_[_loc6_];
               _loc1_ = MathUtil.nextPoint(func_pos2d,360 / _loc5_ * _loc2_,180);
               _loc1_.x = _loc1_.x + (_loc1_.x - func_pos2d.x) * 1.4;
               if(360 / _loc5_ * _loc2_ < 180)
               {
                  _loc1_.y = _loc1_.y + (_loc1_.y - func_pos2d.y) * 0.3;
               }
               _loc4_ = rewardArr[_loc2_];
               heroShowEffList.addTask(createShowEff(_loc1_,rewardArr[_loc2_],_loc2_,false));
               _loc6_++;
            }
         }
         else
         {
            _loc1_ = func_pos2d.clone();
            heroShowEffList.addTask(createShowEff(_loc1_,rewardArr[0],_loc2_,true));
         }
         heroShowEffList.addHandlers(lotteryOneByOne_cpl);
         heroShowEffList.exec();
      }
      
      public function createShowEff(param1:Point, param2:HeroInfo, param3:int, param4:Boolean) : TaskBase
      {
         if(StcMgr.ins.getNpcVo(param2.baseInfo.baseId).quality >= 4)
         {
            return new LHHeroShowEffHigh(this,this.scene,func_pos2d,param1,param2,param3,param4);
         }
         return new LHHeroShowEffNormal(this,this.scene,param1,param2,param3,param4);
      }
      
      private function lotteryOneByOne_cpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         disposeEffPrepare();
         Handler.execute(showResult_cpl);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["msg_lottery_hero_close"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("msg_lottery_hero_close" === _loc3_)
         {
            disposeHeroShowEffList();
            ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.MainCity_moduleIdArr,MainToolBarChangeMsg.MainCity_moduleIdArrVertical,false));
            ModuleMgr.ins.closeModule(11900);
            this.scene.isNpcFuncModel = false;
            scene.tweenMoveCtrl.exec(scene.playerHero.pos2d,1);
         }
      }
      
      public function disposeHeroShowEffList() : void
      {
         if(heroShowEffList != null)
         {
            heroShowEffList.dispose();
            heroShowEffList = null;
         }
      }
      
      override public function triggerLottery() : void
      {
         this.actived();
      }
      
      override public function dispose() : void
      {
         NpcFuncRef.ins.unregFuncHandler(11900,this.actived);
         TweenLite.killDelayedCallsTo(this.lotteryOneByOne);
         disposeEffPrepare();
         disposeHeroShowEffList();
         super.dispose();
      }
   }
}
