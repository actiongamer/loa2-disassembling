package nslm2.modules.scenes.ctrls
{
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.battles.battlefields.ctrls.BattlefieldNpcCtrlFactory;
   import nslm2.modules.battles.PeakSports.control.PeakSportsNpcControllFactory;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DWinActionCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class SceneNpcCtrlBase extends SceneCtrlBase implements IObserver
   {
       
      
      public var npc:SceneNpc3D;
      
      public var autoRo:Boolean = false;
      
      public var autoRoOriVal:Number = NaN;
      
      public var needScaleScene:Boolean = true;
      
      public var cameraScale:Number = 2.4;
      
      public var isCameraTweening:Boolean;
      
      public function SceneNpcCtrlBase()
      {
         super();
      }
      
      public static function createNpcCtrl(param1:StcStageNpcRelationVo) : SceneNpcCtrlBase
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.mount_func;
         if(40400 !== _loc3_)
         {
            if(11900 !== _loc3_)
            {
               if(41400 !== _loc3_)
               {
                  if(41600 !== _loc3_)
                  {
                     if(50500 !== _loc3_)
                     {
                        if(50520 !== _loc3_)
                        {
                           if(41219 !== _loc3_)
                           {
                              if(13312 !== _loc3_)
                              {
                                 if(40501 !== _loc3_)
                                 {
                                    if(!EnvConfig.ins.hideForBS)
                                    {
                                       _loc2_ = new SceneDefaultFuncCtrl();
                                    }
                                 }
                                 else
                                 {
                                    _loc2_ = new SceneNpcDeCtrl();
                                 }
                              }
                              else if(NpcFuncService.ins.isOpenTime(13311))
                              {
                                 _loc2_ = new NewYear2016_SceneBossCtrl();
                              }
                           }
                           else if(!EnvConfig.ins.hideForBS)
                           {
                              _loc2_ = new TreasurePieceRobNpcCtrl();
                           }
                        }
                        else if(!EnvConfig.ins.hideForBS)
                        {
                           _loc2_ = PeakSportsNpcControllFactory.getCtrl(param1);
                        }
                     }
                     else if(!EnvConfig.ins.hideForBS)
                     {
                        _loc2_ = BattlefieldNpcCtrlFactory.getCtrl(param1);
                     }
                  }
                  else if(!EnvConfig.ins.hideForBS)
                  {
                     _loc2_ = new SceneNpcFuncListCtrl();
                  }
               }
               else if(!EnvConfig.ins.hideForBS)
               {
                  _loc2_ = new SceneResDungeonBossCtrl();
               }
            }
            else if(!EnvConfig.ins.hideForBS)
            {
               _loc2_ = new SceneLotteryHeroCtrl();
            }
         }
         else
         {
            _loc2_ = new SceneChapterCtrl();
         }
         if(_loc2_)
         {
            _loc2_.npcRelationId = param1.id;
         }
         return _loc2_;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         ObserverMgr.ins.regObserver(this);
      }
      
      protected function npc_onMouse(... rest) : void
      {
         var _loc2_:* = null;
         if(scene.focusNpcCtrl)
         {
            ObserverMgr.ins.sendNotice("MSG_NPC_FUNC_CLICK_OHTER");
         }
         else
         {
            _loc2_ = MathUtil.nextPoint(this.npc.pos2d,MathUtil.roWith2Point(npc.pos2d,scene.playerHero.pos2d),120);
            scene.playerHero.runTo(_loc2_.x,_loc2_.y,runHandler);
         }
      }
      
      protected function runHandler() : void
      {
         if(autoRo)
         {
            autoRoOriVal = npc.rotationY;
            npc.setRotation(-MathUtil.roWith2Point(npc.pos2d,scene.playerHero.pos2d),true);
         }
         ObserverMgr.ins.sendNotice("scene_run_to_npc",this.npc);
         if(needScaleScene)
         {
            scene.focusNpcCtrl = this;
            scene.hideOtherNpcAndAllPlayers(this.npc);
            npc.doMouseOut();
            npc.overMethodEnabled = false;
            npc.changeTex(true);
            isCameraTweening = true;
            scene.tweenMoveCtrl.exec(npc.pos2d.add(new Point(-40,-120)),cameraScale,1.2,cameraTweenCpl2);
            TweenLite.to(npc,0.5,{"rotationX":20});
         }
      }
      
      protected function cameraTweenCpl2() : void
      {
         new Avatar3DWinActionCtrl(this.npc);
         isCameraTweening = false;
      }
      
      override public function triggerAutoTrack() : void
      {
         npc_onMouse();
      }
      
      override public function dispose() : void
      {
         if(npc)
         {
            npc.removeEventListener("unitMouseTrigger",npc_onMouse);
            this.scene.removeNpc(npc);
            npc = null;
         }
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_player_hero_CHANGE_POS","NPC_FUNC_CLOSE","MSG_NPC_FUNC_CLICK_OHTER"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         var _loc3_:* = param1;
         if("MSG_NPC_FUNC_CLICK_OHTER" !== _loc3_)
         {
            if("NPC_FUNC_CLOSE" !== _loc3_)
            {
               if("msg_player_hero_CHANGE_POS" !== _loc3_)
               {
               }
            }
            if(npc)
            {
               if(!isNaN(autoRoOriVal))
               {
                  npc.setRotation(autoRoOriVal - 90,true);
                  autoRoOriVal = NaN;
               }
               if(scene.focusNpcCtrl == this)
               {
                  scene.focusNpcCtrl = null;
                  if(needScaleScene)
                  {
                     scene.hideOtherNpcAndAllPlayers(null);
                     scene.tweenMoveCtrl.exec(npc.pos2d,1,0.4);
                     npc.changeTex(false);
                     npc.overMethodEnabled = true;
                     TweenLite.to(npc,0.3,{"rotationX":0});
                  }
               }
            }
         }
         else if(npc)
         {
            if(scene.focusNpcCtrl == this && isCameraTweening == false)
            {
               ModuleMgr.ins.closeModule(41600);
            }
         }
      }
   }
}
