package nslm2.modules.scenes.shenYuans.scenes
{
   import nslm2.modules.scenes.ctrls.SceneNpcCtrlBase;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.modules.funnies.teamGuajiScenes.BossRandomRun;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DAutoRandomActionCtrl;
   import nslm2.common.compsEffects.SummaryZoomInEffCtrl2;
   import game.ui.resourceDg.ResTalkUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import nslm2.utils.TransformUtil;
   import flash.geom.Vector3D;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianBuffVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.scenes.shenYuans.ShenYuanModule;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ShenYuanNpcCtrl extends SceneNpcCtrlBase
   {
       
      
      private var syModel:ShenYuanModel;
      
      public var randomWalkCtrl:BossRandomRun;
      
      private var randomActCtrl:Avatar3DAutoRandomActionCtrl;
      
      private var szc:SummaryZoomInEffCtrl2;
      
      private var _say:Array;
      
      private var talkBox:ResTalkUI;
      
      public function ShenYuanNpcCtrl()
      {
         _say = [41300500,41300501,41300502,41300503,41300504,41300505,41300506,41300507,41300508,41300509];
         super();
         this.needScaleScene = false;
         this.autoRo = true;
         syModel = ShenYuanModel.ins;
      }
      
      protected function setSummaryView(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         if(szc)
         {
            szc.dispose();
         }
         if(param1)
         {
            _loc2_ = _say[int(_say.length * Math.random())];
            if(talkBox == null)
            {
               talkBox = new ResTalkUI();
               this.scene.addChild(talkBox);
            }
            this.talkBox.visible = true;
            talkBox.txt_summary.text = LocaleMgr.ins.getStr(_loc2_);
            szc = new SummaryZoomInEffCtrl2(this.talkBox.bg,MathUtil.random(5,2),5,hideHandler,showHandler);
            UIMgr.stage.addEventListener("enterFrame",onEF);
         }
         else
         {
            if(this.talkBox)
            {
               this.talkBox.visible = false;
            }
            UIMgr.stage.removeEventListener("enterFrame",onEF);
         }
      }
      
      public function disposeSZC() : void
      {
         if(szc)
         {
            szc.dispose();
         }
         UIMgr.stage.removeEventListener("enterFrame",onEF);
         if(talkBox)
         {
            this.talkBox.dispose();
            this.talkBox = null;
         }
      }
      
      private function showHandler() : void
      {
      }
      
      protected function onEF(param1:Event) : void
      {
         var _loc2_:* = null;
         if(this.talkBox && this.talkBox.stage)
         {
            _loc2_ = TransformUtil.stage3Dto2D(npc.tag3DVBox.scenePosition,scene);
            this.talkBox.x = _loc2_.x + 20;
            this.talkBox.y = _loc2_.y;
         }
      }
      
      private function hideHandler() : void
      {
         var _loc1_:String = _say[int(_say.length * Math.random())];
         talkBox.txt_summary.text = LocaleMgr.ins.getStr(_loc1_);
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.npc = this.scene.addNpcByNpcRelationId(this.npcRelationId);
         this.npc.overMethodEnabled = true;
         this.npc.overMethodColor = 16723968;
         npc.addEventListener("unitMouseTrigger",npc_onMouse);
         randomWalkCtrl = new BossRandomRun(npc);
      }
      
      public function changeLook(param1:int) : void
      {
         lev = param1;
         var levelName:String = LocaleMgr.ins.getStr(999000521,[lev]);
         var vo:StcNvshendianBuffVo = StcMgr.ins.getNvshendianBuffVo(lev);
         if(vo == null)
         {
            npc.visible = false;
            return;
         }
         if(npc.visible == false)
         {
            npc.visible = true;
         }
         if(randomActCtrl)
         {
            randomActCtrl.dispose();
            randomActCtrl = null;
         }
         setSummaryView(false);
         var _loc3_:* = vo.kind;
         if(ShenYuanModule.FLOOR_TYPE_MONSTER !== _loc3_)
         {
            if(ShenYuanModule.FLOOR_TYPE_CHEST !== _loc3_)
            {
               if(ShenYuanModule.FLOOR_TYPE_BUFF === _loc3_)
               {
                  var npcName:String = "BUFF";
                  npc.tag3DVBox.showGuildName(levelName,"");
                  npc.tag3DVBox.initName(npcName,4827135);
                  npc.initByModelId(21003);
                  npc.showFightCursor = false;
                  npc.tag3DVBox.y = 216;
                  TimerManager.ins.doOnce(1000,function():void
                  {
                     npc.initMouseMesh();
                  });
               }
            }
            else
            {
               npcName = LocaleMgr.ins.getStr(999000522);
               npc.tag3DVBox.showGuildName(levelName,"");
               npc.tag3DVBox.initName(npcName,4827135);
               npc.actStd = "std_3";
               randomActCtrl = new Avatar3DAutoRandomActionCtrl(npc,["std_3","win"]);
               npc.initByModelId(30002);
               npc.showFightCursor = false;
            }
         }
         else
         {
            var ll:int = lev - syModel.crtFloor;
            if(ll <= 0)
            {
               var groupId:int = syModel.crtMonsterData[2].id;
            }
            else
            {
               groupId = syModel.monstersForNextLayers[ll - 1].id;
            }
            var npcvo:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(groupId);
            npcName = LocaleMgr.ins.getStr(npcvo.name);
            var stcNpcId:int = npcvo.display_npc;
            npc.actStd = "std_2";
            npc.tag3DVBox.showGuildName(levelName,"");
            npc.tag3DVBox.initName(npcName,16723968);
            var $stcNpcVo:StcNpcVo = StcMgr.ins.getNpcVo(stcNpcId);
            npc.initByModelId(int($stcNpcVo.model_id),$stcNpcVo.sex,FactoryUtil.weapon_ModelVos(stcNpcId),FactoryUtil.getWingModel3DVoByStcNpcId(stcNpcId),55);
            npc.showFightCursor = true;
            randomWalkCtrl.start();
            setSummaryView(true);
         }
      }
      
      override protected function runHandler() : void
      {
         if(syModel.currFloorType != ShenYuanModule.FLOOR_TYPE_MONSTER)
         {
            ObserverMgr.ins.sendNotice("SHENYUAN_CURRENT_LEVEL_CLICK");
         }
      }
      
      public function resetRo() : void
      {
         if(!isNaN(autoRoOriVal))
         {
            npc.setRotation(autoRoOriVal - 90,true);
         }
      }
      
      override public function dispose() : void
      {
         randomWalkCtrl.dispose();
         if(randomActCtrl)
         {
            randomActCtrl.dispose();
            randomActCtrl = null;
         }
         disposeSZC();
         super.dispose();
      }
   }
}
