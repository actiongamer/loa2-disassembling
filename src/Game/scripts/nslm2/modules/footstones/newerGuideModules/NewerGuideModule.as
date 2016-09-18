package nslm2.modules.footstones.newerGuideModules
{
   import game.ui.newerGuideModules.NewerGuideModuleUI;
   import com.mz.core.components.comp2d.BlackRim;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.setting.service.SettingService;
   import com.mz.core.configs.EnvConfig;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Rectangle;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.logging.Log;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import morn.core.components.Component;
   import nslm2.common.globals.GlobalRef;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.geom.Point;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.modules.Chapters.ChapterModel;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import flash.display.DisplayObject;
   import nslm2.common.ui.components.comps2d.others.dungeonFlags.DungeonFlagNormalRender;
   import flash.display.DisplayObjectContainer;
   import com.mz.core.utils.MathUtil;
   import flash.events.Event;
   import nslm2.modules.footstones.gmModules.PlayerLogUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class NewerGuideModule extends NewerGuideModuleUI
   {
      
      public static const GUILDID:String = "guildId";
      
      public static const WAIT:String = "wait";
      
      public static const DONE:String = "done";
       
      
      private var _rim:BlackRim;
      
      private var _talkRim:BlackRim;
      
      private var curNGVo:nslm2.modules.footstones.newerGuideModules.CurNGVo;
      
      private var ngIdToUIDict:DictHash;
      
      private var _curMainGuideVo:StcGuideVo;
      
      private var _isShowingSubNg:Boolean;
      
      private var showRimTimer:int;
      
      private var history:Object;
      
      public function NewerGuideModule()
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         curNGVo = new nslm2.modules.footstones.newerGuideModules.CurNGVo();
         ngIdToUIDict = new DictHash();
         super();
         MornExpandUtil.setLayout(this);
         this.arrowComp.newerGuideModule = this;
         this.mouseEnabled = false;
         this.sayComp.mouseEvent = false;
         this.arrowComp.mouseEvent = false;
         _rim = new BlackRim();
         _rim.width = ClientConfig.SCENE_FIXED_W;
         _rim.height = ClientConfig.SCENE_FIXED_H;
         _rim.visible = false;
         _rim.fileAlpha = 0;
         this.addChildAt(_rim,0);
         _rim.addEventListener("click",rim_onClick);
         _talkRim = new BlackRim();
         _talkRim.width = ClientConfig.SCENE_FIXED_W;
         _talkRim.height = ClientConfig.SCENE_FIXED_H;
         _talkRim.visible = false;
         _talkRim.fileAlpha = 0;
         _talkRim.draw();
         DisplayUtils.addChildAbove(_talkRim,_rim);
         arrowComp.rim = _rim;
         arrowComp.talkRim = _talkRim;
         if(NGUtil.ref != null)
         {
            Log.fatal(this,"NewerGuideModule should create once!");
         }
         NGUtil.ref = this;
         if(ClientConfig.firstBattle == 1)
         {
            curNGVo.stcVo = StcMgr.ins.getGuideVo(90001);
            curMainGuideVo = curNGVo.stcVo;
         }
         else
         {
            initAfterFirstBattle();
            _isShowingSubNg = false;
            _loc2_ = SettingService.ins.getValue(5);
            if(int(_loc2_) != 0)
            {
               _loc1_ = StcMgr.ins.getGuideVo(int(_loc2_));
               if(_loc1_)
               {
                  if(_loc1_.jump_id > 0)
                  {
                     if(_loc1_.jump_id == 4444)
                     {
                        curNGVo.stcVo = null;
                        SettingService.ins.save(5,0);
                     }
                     else
                     {
                        curNGVo.stcVo = StcMgr.ins.getGuideVo(_loc1_.jump_id);
                     }
                  }
                  else
                  {
                     curNGVo.stcVo = _loc1_;
                  }
                  curMainGuideVo = curNGVo.stcVo;
               }
               else
               {
                  new StcLackFatal(this,"static_guide",int(_loc2_));
               }
            }
            initSubNg();
         }
         this.uiSkip.buttonMode = true;
         this.uiSkip.addEventListener("click",uiSkipHandler);
         this.uiSkip.visible = false;
         this.uiSkip.right = 6;
         this.uiSkip.bottom = 6;
      }
      
      private function get sayComp() : NewerGuideNPCSay
      {
         return this.sayCompUI as NewerGuideNPCSay;
      }
      
      public function get arrowComp() : NewerGuideArrow
      {
         return this.arrowCompUI as NewerGuideArrow;
      }
      
      private function get skipRef() : NewerGuideSkip
      {
         return this.uiSkip as NewerGuideSkip;
      }
      
      private function get stcVos() : DictHash
      {
         return StcMgr.ins.getGuideTable();
      }
      
      public function initSubNg() : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         initHisotry();
         var _loc3_:Array = history["guildId"]["wait"];
         history["guildId"]["wait"] = ArrayUtil.removeRepeat(_loc3_);
         var _loc1_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc1_)
         {
            _loc2_ = StcMgr.ins.getGuideVo(_loc3_[_loc5_]);
            if(_loc2_)
            {
               if(_loc2_.jump_id > 0)
               {
                  if(_loc2_.jump_id == 4444)
                  {
                     this.removeWait(_loc3_[_loc5_]);
                  }
                  else
                  {
                     _loc4_ = StcMgr.ins.getGuideVo(_loc2_.root_id);
                     if(_loc4_ && NGConsts.outLevel(_loc4_.id))
                     {
                        this.removeWait(_loc3_[_loc5_]);
                     }
                     else
                     {
                        this.changeWait(_loc2_.jump_id);
                     }
                  }
               }
            }
            else
            {
               this.removeWait(_loc3_[_loc5_]);
               new StcLackFatal(this,"static_guide",_loc3_[_loc5_]);
            }
            _loc5_++;
         }
      }
      
      public function initAfterFirstBattle() : void
      {
         if(history == null)
         {
            initHisotry();
         }
      }
      
      public function uiSkipHandler(param1:MouseEvent = null) : void
      {
         SettingService.ins.save(5,0);
         curNGVo.isShow = false;
         curNGVo.stcVo = null;
         this.hideArrow();
      }
      
      private function rim_onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(param1.altKey && param1.ctrlKey && EnvConfig.ins.simpleGM)
         {
            this.skipRef.hide();
            _rim.visible = false;
            this.arrowComp.hide();
         }
         else if(_rim.hole)
         {
            if(TimerManager.ins.currTimer - showRimTimer > 2000)
            {
               if(curNGVo.comp)
               {
                  if(curNGVo.comp.parent == null || curNGVo.comp.stage == null || DisplayUtils.checkParentAllVisibleFalse(curNGVo.comp))
                  {
                     uiSkipHandler();
                     return;
                  }
               }
               if(_rim.hole.intersects(new Rectangle(0,0,UIMgr.gameWidth,UIMgr.gameHeight)) == false)
               {
                  uiSkipHandler();
                  return;
               }
            }
            _loc2_ = new TweenRim();
            this.addChildAt(new TweenRim(),0);
            _loc2_.width = _rim.width;
            _loc2_.height = _rim.height;
            _loc2_.hole = _rim.hole;
            _loc2_.play();
         }
         else if(TimerManager.ins.currTimer - showRimTimer > 11000)
         {
            this.uiSkipHandler();
         }
      }
      
      public function get isShowLock() : Boolean
      {
         return curNGVo.isShow && curNGVo.stcVo.is_unlock == 0;
      }
      
      public function get isShow() : Boolean
      {
         return curNGVo.isShow;
      }
      
      public function setNotShow() : void
      {
         curNGVo.isShow = false;
      }
      
      public function gm_gotoId(param1:int) : void
      {
         if(curNGVo.isShow)
         {
            curNGVo.isShow = false;
            this.sayComp.hide(false);
            this.arrowComp.hide(false);
         }
         if(param1)
         {
            if(isSubNg(param1))
            {
               curNGVo.stcVo = stcVos.getValue(param1);
               this.addWait(param1);
            }
            else
            {
               curMainGuideVo = stcVos.getValue(param1);
               curNGVo.stcVo = stcVos.getValue(param1);
            }
            if(curNGVo.stcVo)
            {
               if(curNGVo.stcVo.level && curNGVo.stcVo.level > PlayerModel.ins.level)
               {
                  Log.warn(this,"触发等级不足 ID:",curNGVo.stcVo.id);
               }
               else
               {
                  if(isSubNg(param1) == false)
                  {
                     SettingService.ins.save(5,curNGVo.stcVo.id);
                  }
                  if(curNGVo.stcVo.scriptId)
                  {
                     this.hideArrow();
                     this.checkModuleShow(curNGVo.stcVo.func_id,null,false);
                  }
                  else if(StringUtils.isNull(curNGVo.stcVo.talk) == false)
                  {
                     this.checkModuleShow(curNGVo.stcVo.func_id,null,false);
                  }
                  else if(this.checkModuleShow(curNGVo.stcVo.func_id,null,false) == false)
                  {
                     Log.warn(this,"无法执行新手指引 StcGuideVo.id",param1);
                     this.hideArrow();
                  }
               }
            }
            else
            {
               Log.warn(this,"错误的新手指引 StcGuideVo.id",param1);
            }
         }
         else
         {
            this.hideArrow();
         }
      }
      
      public function isSubNg(param1:int) : Boolean
      {
         var _loc2_:StcGuideVo = StcMgr.ins.getGuideVo(param1);
         if(_loc2_ && _loc2_.is_trigger != 0)
         {
            return true;
         }
         return false;
      }
      
      public function isRepeatNg(param1:int) : Boolean
      {
         var _loc2_:StcGuideVo = StcMgr.ins.getGuideVo(param1);
         if(_loc2_ && _loc2_.is_trigger == 2)
         {
            return true;
         }
         return false;
      }
      
      public function checkModuleHide(param1:int) : Boolean
      {
         if(curNGVo.stcVo && curNGVo.stcVo.func_id == param1 && curNGVo.isShow)
         {
            this.sayComp.hide(false);
            this.arrowComp.hide(false);
            return true;
         }
         return false;
      }
      
      public function isOverWait() : Boolean
      {
         if(_rim)
         {
            return _rim.visible && _rim.hole == null;
         }
         return false;
      }
      
      public function get curStcVo() : StcGuideVo
      {
         return this.curNGVo.stcVo;
      }
      
      public function isCurFuncId(param1:int, param2:Boolean = false) : Boolean
      {
         if(curNGVo.stcVo && curNGVo.stcVo.func_id == param1)
         {
            if(param2)
            {
               if(curNGVo.stcVo.is_unlock == 0)
               {
                  return true;
               }
               return false;
            }
            return true;
         }
         return false;
      }
      
      public function isCurGuideId(param1:int) : Boolean
      {
         if(curNGVo.stcVo && curNGVo.stcVo.id == param1)
         {
            return true;
         }
         return false;
      }
      
      public function changeScene() : void
      {
         if(curNGVo.isShow)
         {
            curNGVo.isShow = false;
            this.sayComp.hide(false);
            this.arrowComp.hide(false);
         }
      }
      
      public function checkNewStcItemId(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.curNGVo.stcVo == null)
         {
            if(param1 == 11110)
            {
               _loc2_ = 99367;
            }
            if(_loc2_)
            {
               if(EnvConfig.ins.showDebugModule || this.isWait(_loc2_) == false)
               {
                  this.curNGVo.stcVo = StcMgr.ins.getGuideVo(_loc2_);
                  if(this.curNGVo.stcVo == null)
                  {
                     return;
                  }
                  if(isSubNg(curNGVo.stcVo.id) == false)
                  {
                     SettingService.ins.save(5,curNGVo.stcVo.id);
                  }
                  this.addWait(_loc2_);
                  if(ModuleMgr.ins.isShow(this.curNGVo.stcVo.func_id))
                  {
                     this.checkModuleShow(this.curNGVo.stcVo.func_id,null,true);
                  }
               }
            }
         }
      }
      
      public function checkRuneNg(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:StcGuideVo = StcMgr.ins.getGuideVo(99900);
         if(_loc3_ && TreasureUtil.checkCanRuneNg(true,true))
         {
            if(EnvConfig.ins.showDebugModule || this.isWait(_loc3_.id) == false)
            {
               this.addWait(_loc3_.id);
               this.addDone(_loc3_.id);
               if(NGUtil.isShow == false)
               {
                  this.checkModuleShow(_loc3_.func_id,null,true);
               }
            }
         }
      }
      
      public function chapterCpl(param1:int) : void
      {
         this.curNGVo.stcVo = StcMgr.ins.getGuideVo(param1);
         curMainGuideVo = StcMgr.ins.getGuideVo(param1);
         if(curNGVo.isShow)
         {
            curNGVo.isShow = false;
            this.sayComp.hide(false);
            this.arrowComp.hide(false);
         }
         if(this.curNGVo.stcVo == null)
         {
            return;
         }
         if(isSubNg(curNGVo.stcVo.id) == false)
         {
            SettingService.ins.save(5,curNGVo.stcVo.id);
         }
      }
      
      public function levelUp(param1:int) : void
      {
         var _loc2_:StcGuideVo = StcMgr.ins.getVoByColumnValue("static_guide","level",param1);
         if(_loc2_)
         {
            if(isSubNg(_loc2_.id) == false)
            {
               this.curNGVo.stcVo = _loc2_;
               curMainGuideVo = _loc2_;
               SettingService.ins.save(5,_loc2_.id);
               if(curNGVo.isShow)
               {
                  curNGVo.isShow = false;
                  this.sayComp.hide(false);
                  this.arrowComp.hide(false);
               }
               this.checkModuleShow(this.curNGVo.stcVo.func_id,null,true);
            }
            else
            {
               this.checkRuneNg(true,true);
            }
         }
      }
      
      public function levelUpWinClose(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:StcGuideVo = StcMgr.ins.getVoByColumnValue("static_guide","level",param1);
         if(_loc2_)
         {
            _loc3_ = StcMgr.ins.getGuideVo(_loc2_.next_id);
            if(_loc3_)
            {
               this.curNGVo.stcVo = _loc3_;
               curMainGuideVo = _loc3_;
               SettingService.ins.save(5,_loc3_.id);
               if(curNGVo.isShow)
               {
                  curNGVo.isShow = false;
                  this.sayComp.hide(false);
                  this.arrowComp.hide(false);
               }
               this.checkModuleShow(this.curNGVo.stcVo.func_id,null,true);
            }
         }
      }
      
      private function checkAndFindTriggerContainer(param1:Component, param2:StcGuideVo) : Component
      {
         if(param2.comp_id == "sceneModuleClose")
         {
            param1 = GlobalRef.bottomModuleBtns;
         }
         else
         {
            if(param1 == null)
            {
               param1 = NGUtil.getTempFunc(param2.func_id);
            }
            if(param1 == null)
            {
               param1 = ModuleMgr.ins.getModule(param2.func_id);
            }
         }
         return param1;
      }
      
      private function get curMainGuideVo() : StcGuideVo
      {
         return _curMainGuideVo;
      }
      
      private function set curMainGuideVo(param1:StcGuideVo) : void
      {
         if(_isShowingSubNg == false)
         {
            _curMainGuideVo = param1;
         }
      }
      
      public function checkModuleShow(param1:int, param2:Component, param3:Boolean) : Boolean
      {
         if(curMainGuideVo && checkModuleShowMain(param1,param2,param3,curMainGuideVo))
         {
            return true;
         }
         return checkSubModuleShow(param1,param2,param3);
      }
      
      public function checkModuleShowMain(param1:int, param2:Component, param3:Boolean, param4:StcGuideVo) : Boolean
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         if(EnvConfig.ins.hideForBS)
         {
            return false;
         }
         if(param4 && param4.func_id == param1)
         {
            if(param4.level && param4.level > PlayerModel.ins.level)
            {
               return false;
            }
            if(param4.scriptId)
            {
               if(curNGVo.isShow == true)
               {
                  return false;
               }
            }
            if(param2 == null)
            {
               param2 = checkAndFindTriggerContainer(param2,param4);
            }
            if(param2 is INewerGuideCheckHandler)
            {
               _loc6_ = (param2 as INewerGuideCheckHandler).ngCheck(param4.checkId,param4.checkParams,param4);
               switch(int(_loc6_))
               {
                  case 0:
                     Log.info(this,"新手引导检测失败 ID:",param4.id,"check",param4.checkId,"result",_loc6_);
                     uiSkipHandler(null);
                     return false;
                  case 1:
                  case 2:
                     this.hideArrow();
                     return playNext(false);
                  case 3:
                     if(curNGVo.stcVo.id == param4.id)
                     {
                        curNGVo.isShow = false;
                        this.hideArrow();
                     }
                     return false;
                  case 4:
                     return false;
               }
            }
            if(param2 == null)
            {
               Log.debug(this,"没找到组件容器 StcGuideVo.id",param4.id,"func_id:",param4.func_id);
               return false;
            }
            if(param4.scriptId)
            {
               curNGVo.stcVo = param4;
               curNGVo.triggerContainer = param2;
               curNGVo.isShow = true;
               ObserverMgr.ins.sendNotice("msg_ng_script",this.curNGVo.stcVo.lua);
               this.saveStep(curNGVo.stcVo);
               return true;
            }
            if(param4.isFindNpc)
            {
               curNGVo.stcVo = param4;
               this.skipRef.hide();
               _rim.visible = false;
               curNGVo.isShow = true;
               ObserverMgr.ins.sendNotice("msg_ng_move_to_npc",curNGVo.stcVo.comp_id.split(":")[1]);
               this.saveStep(curNGVo.stcVo);
               return true;
            }
            if(StringUtils.isNull(param4.talk) == false && StringUtils.isNull(param4.comp_id) == true)
            {
               curNGVo.stcVo = param4;
               _rim.hole = null;
               _rim.draw();
               _rim.visible = false;
               this.arrowComp.mouseRim.hole = null;
               this.arrowComp.mouseRim.draw();
               curNGVo.isShow = true;
               curNGVo.arrowParent = this;
               curNGVo.triggerContainer = param2;
               this.arrowComp.show(curNGVo.arrowParent,DisplayUtils.localToTarget(ModuleMgr.ins.topEffectLayer,curNGVo.arrowParent,new Point(UIMgr.gameWidth / 2,UIMgr.gameHeight / 2)),new Point(0,0),curNGVo.stcVo,param3);
               this.saveStep(curNGVo.stcVo);
               return true;
            }
            if(param4.comp_id == "sceneModuleClose")
            {
               _loc5_ = GlobalRef.bottomModuleBtns.btnBack;
            }
            else if(param4.comp_id == "fullScreenBtn")
            {
               _loc5_ = GlobalRef.playerHeader_icon_fullscreen;
            }
            else if(param2 is INewerGuideGetComp)
            {
               _loc5_ = (param2 as INewerGuideGetComp).getCompById(param4.comp_id,param4);
            }
            else
            {
               _loc5_ = NGUtil.getCompById(param2,param4.comp_id,param4);
            }
            if(_loc5_)
            {
               curNGVo.stcVo = param4;
               if(curNGVo.stcVo.func_id == 10430 || curNGVo.stcVo.func_id == 10400)
               {
                  if(ModuleMgr.ins.popLayer.curModuleId == 40400)
                  {
                     ModuleMgr.ins.popLayer.closeAll();
                     GlobalRef.chapterModuleShowAgainVo = new ChapterModuleInitVo(ChapterModel.ins.lastOpenChapterId,0,false);
                  }
                  else
                  {
                     ModuleMgr.ins.popLayer.closeAll();
                  }
               }
               curNGVo.triggerContainer = param2;
               curNGVo.comp = _loc5_;
               if(param2 is INewerGuideGetCompParent)
               {
                  curNGVo.arrowParent = (param2 as INewerGuideGetCompParent).getCompParentById(curNGVo.stcVo);
               }
               else
               {
                  curNGVo.arrowParent = param2;
               }
               curNGVo.isShow = true;
               App.render.renderAll();
               showArrow(param3);
               _loc5_.addEventListener("click",onComp_clickHdr,false,10000);
               if(curNGVo.stcVo.is_save == 1)
               {
                  if(isSubNg(curNGVo.stcVo.id))
                  {
                     this.changeWait(curNGVo.stcVo.next_id);
                  }
                  else
                  {
                     SettingService.ins.save(5,curNGVo.stcVo.next_id);
                  }
               }
               this.saveStep(curNGVo.stcVo);
               return true;
            }
            if(curNGVo.stcVo)
            {
               Log.info(this,"没找到 新手指引需要的组件,NGID:",curNGVo.stcVo.id);
            }
            else
            {
               Log.info(this,"没找到 新手指引需要的组件,stcVo is null");
            }
         }
         return false;
      }
      
      public function checkSubModuleShow(param1:int, param2:Component, param3:Boolean) : Boolean
      {
         var _loc4_:* = null;
         if(ClientConfig.firstBattle == 1)
         {
            return false;
         }
         _isShowingSubNg = true;
         var _loc6_:Array = (history["guildId"]["wait"] as Array).concat(NewerAlertModel.ins.alertNewerGuideArr);
         var _loc8_:int = 0;
         var _loc7_:* = _loc6_;
         for each(var _loc5_ in _loc6_)
         {
            _loc4_ = StcMgr.ins.getGuideVo(_loc5_);
            if(_loc4_)
            {
               if(checkModuleShowMain(param1,param2,param3,_loc4_))
               {
                  if(_loc4_.is_trigger == 2)
                  {
                     ArrayUtil.removeItem(NewerAlertModel.ins.alertNewerGuideArr,_loc4_.id);
                  }
                  return true;
               }
            }
         }
         _isShowingSubNg = false;
         return false;
      }
      
      private function onComp_clickHdr(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
         _loc2_.removeEventListener("click",onComp_clickHdr);
         if(curNGVo && curNGVo.isShow && curNGVo.comp == _loc2_)
         {
            playNext();
         }
      }
      
      public function checkCpl(param1:int) : void
      {
         if(curNGVo && curNGVo.isShow && curNGVo.stcVo.id == param1)
         {
            playNext();
         }
      }
      
      public function findNgCpl() : void
      {
         if(this.curNGVo.isShow)
         {
            this.playNext();
         }
      }
      
      private function playNext(param1:Boolean = true) : Boolean
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc3_:Boolean = false;
         if(curNGVo.stcVo.is_save != 0)
         {
            if(isSubNg(curNGVo.stcVo.id))
            {
               if(curNGVo.stcVo.next_id != 0)
               {
                  _loc2_ = StcMgr.ins.getGuideVo(curNGVo.stcVo.next_id);
                  if(_loc2_ && (_loc2_.jump_id == 0 || _loc2_.jump_id == 4444))
                  {
                     this.removeWait(curNGVo.stcVo.id);
                  }
                  else if(curNGVo.stcVo.is_trigger != 2)
                  {
                     this.changeWait(curNGVo.stcVo.next_id);
                  }
               }
               else
               {
                  this.removeWait(curNGVo.stcVo.id);
               }
            }
            else
            {
               SettingService.ins.save(5,curNGVo.stcVo.next_id);
            }
         }
         if(curNGVo.stcVo.next_id == 0)
         {
            curMainGuideVo = null;
            curNGVo.isShow = false;
            curNGVo.stcVo = null;
            this.hideArrow();
            return false;
         }
         var _loc6_:StcGuideVo = this.stcVos.getValue(curNGVo.stcVo.next_id);
         var _loc4_:int = this.curNGVo.stcVo.func_id;
         var _loc7_:int = curNGVo.stcVo.is_over;
         curMainGuideVo = _loc6_;
         curNGVo.stcVo = _loc6_;
         curNGVo.isShow = false;
         if(_loc6_.id == 99155 || _loc6_.id == 97180)
         {
            if(ModuleMgr.ins.isShow(40400) == false)
            {
               ModuleMgr.ins.showModule(40400);
            }
         }
         if(_loc6_)
         {
            if(_loc7_ == 0)
            {
               if(curNGVo.stcVo.scriptId)
               {
                  this.hideArrow();
                  if(isRepeatNg(_loc6_.id))
                  {
                     NewerAlertModel.ins.alertNewerGuideArr.push(_loc6_.id);
                     return this.checkModuleShowMain(curNGVo.stcVo.func_id,null,true,_loc6_);
                  }
                  return this.checkModuleShow(curNGVo.stcVo.func_id,null,true);
               }
               if(_loc6_.func_id == _loc4_)
               {
                  _loc5_ = curNGVo.triggerContainer;
               }
               else
               {
                  _loc5_ = null;
               }
               this.hideArrow();
               if(isRepeatNg(_loc6_.id))
               {
                  NewerAlertModel.ins.alertNewerGuideArr.push(_loc6_.id);
                  _loc3_ = this.checkModuleShowMain(curNGVo.stcVo.func_id,null,true,_loc6_);
               }
               else
               {
                  _loc3_ = this.checkModuleShow(curNGVo.stcVo.func_id,_loc5_,true);
               }
               return _loc3_;
            }
            if(curNGVo.stcVo.is_unlock == 0)
            {
               this.hideArrow();
               if(_loc7_ == 2 && param1)
               {
                  _rim.visible = true;
                  _rim.hole = null;
                  _rim.draw();
                  showRimTimer = TimerManager.ins.currTimer;
               }
            }
            else
            {
               this.hideArrow();
            }
            return false;
         }
         this.hideArrow();
         return false;
      }
      
      private function hideArrow() : void
      {
         this.skipRef.hide();
         _rim.visible = false;
         this.sayComp.hide();
         this.arrowComp.hide();
         NewerAlertModel.ins.alertNewerGuideArr = [];
      }
      
      private function showArrow(param1:Boolean) : void
      {
         var _loc4_:Component = curNGVo.arrowParent;
         var _loc2_:Point = getCompPoi(curNGVo.arrowParent,curNGVo.comp,curNGVo.stcVo.direction);
         if(_loc4_ == null)
         {
            _loc4_ = this;
         }
         var _loc7_:int = 2;
         var _loc5_:Point = new Point(curNGVo.comp.width - _loc7_ * 2,curNGVo.comp.height - _loc7_ * 2);
         if(curNGVo.comp is DungeonFlagNormalRender)
         {
            _loc5_.x = _loc5_.x - 10;
         }
         var _loc6_:Array = !!StringUtils.isNull(curNGVo.stcVo.guide_position)?[]:curNGVo.stcVo.guide_position.split(",");
         if(isNaN(Number(_loc6_[2])) == false)
         {
            _loc5_.x = Number(_loc6_[2]);
         }
         if(isNaN(Number(_loc6_[3])) == false)
         {
            _loc5_.y = Number(_loc6_[3]);
         }
         var _loc3_:Point = DisplayUtils.localToTarget(curNGVo.comp.parent,this,new Point(curNGVo.comp.x,curNGVo.comp.y));
         _loc3_.x = _loc3_.x + _loc7_;
         _loc3_.y = _loc3_.y + _loc7_;
         if(isNaN(Number(_loc6_[0])) == false)
         {
            _loc3_.x = _loc3_.x + Number(_loc6_[0]);
         }
         if(isNaN(Number(_loc6_[1])) == false)
         {
            _loc3_.y = _loc3_.y + Number(_loc6_[1]);
         }
         if(curNGVo.stcVo.is_unlock || curNGVo.stcVo.isFindNpc)
         {
            this.skipRef.hide();
            _rim.visible = false;
         }
         else
         {
            this.skipRef.show();
            _rim.visible = true;
            _rim.hole = new Rectangle(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y);
            this.arrowComp.mouseRim.hole = _rim.hole;
            showRimTimer = TimerManager.ins.currTimer;
            _rim.draw();
            this.arrowComp.mouseRim.draw();
         }
         if(curNGVo.arrowParent == null)
         {
            this.arrowComp.show(_loc4_,ModuleMgr.ins.toGlobalPoi(curNGVo.comp),_loc5_,curNGVo.stcVo,param1);
         }
         else
         {
            this.arrowComp.show(_loc4_,DisplayUtils.localToTarget(curNGVo.comp,curNGVo.arrowParent),_loc5_,curNGVo.stcVo,param1);
         }
      }
      
      private function getCompPoi(param1:DisplayObjectContainer, param2:Component, param3:int) : Point
      {
         var _loc4_:* = null;
         switch(int(param3) - 1)
         {
            case 0:
               _loc4_ = new Point(param2.x + param2.width,param2.y + param2.height / 2);
               break;
            default:
               _loc4_ = new Point(param2.x + param2.width,param2.y + param2.height / 2);
               break;
            case 2:
            default:
               _loc4_ = new Point(param2.x + param2.width / 2,param2.y + param2.height);
               break;
            case 4:
            default:
               _loc4_ = new Point(param2.x,param2.y + param2.height / 2);
               break;
            case 6:
               _loc4_ = new Point(param2.x + param2.width / 2,param2.y);
         }
         return DisplayUtils.localToTarget(param2.parent,param1,_loc4_);
      }
      
      public function setArrowPos(param1:Point, param2:Point) : void
      {
         this.arrowComp.show(this,param1,param2,this.curNGVo.stcVo,true);
      }
      
      public function changeArrowPos(param1:Point, param2:Point) : void
      {
         this.arrowComp.changePosition(param1,param2,this.curNGVo.stcVo);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_GM_CMD","msg_ng_script_cpl","msg_ng_talk_cpl"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("MSG_GM_CMD" !== _loc3_)
         {
            if("msg_ng_script_cpl" !== _loc3_)
            {
               if("msg_ng_talk_cpl" === _loc3_)
               {
                  if(this.curNGVo.isShow && StringUtils.isNull(this.curNGVo.stcVo.comp_id) == true)
                  {
                     this.playNext();
                  }
               }
            }
            else if(this.curNGVo.isShow && this.curNGVo.stcVo.scriptId == int(param2))
            {
               this.playNext();
            }
         }
         else
         {
            _loc3_ = param2[0];
            if("ngj" !== _loc3_)
            {
               if("ngc" !== _loc3_)
               {
                  if("ngcd" !== _loc3_)
                  {
                     if("ng" !== _loc3_)
                     {
                        if("lv" !== _loc3_)
                        {
                           if("lvup" === _loc3_)
                           {
                              PlayerModel.ins.gm_level = MathUtil.maxMin(PlayerModel.ins.level + 1,90,1);
                           }
                        }
                        else
                        {
                           PlayerModel.ins.gm_level = MathUtil.maxMin(int(param2[1]),90,1);
                        }
                     }
                     else
                     {
                        NGUtil.gm_gotoId(int(param2[1]));
                     }
                  }
                  else
                  {
                     initHisotry();
                     history["guildId"]["done"] = [];
                     history["guildId"]["wait"] = [];
                     saveHistory();
                  }
               }
               else
               {
                  uiSkipHandler();
               }
            }
            else if(this.curNGVo.stcVo && this.curNGVo.stcVo.jump_id > 0)
            {
               curNGVo.stcVo = StcMgr.ins.getGuideVo(this.curNGVo.stcVo.jump_id);
               NGUtil.gm_gotoId(curNGVo.stcVo.id);
            }
            else
            {
               Log.warn(this,"当前指引无法jump",!!this.curNGVo.stcVo?null:this.curNGVo.stcVo.id);
            }
         }
      }
      
      override protected function onResize(param1:Event) : void
      {
         super.onResize(param1);
         if(this.curNGVo && this.curNGVo.isShow && this.curNGVo.comp && this.curNGVo.comp.stage)
         {
            if(!curNGVo.stcVo.scriptId)
            {
               if(!curNGVo.stcVo.isFindNpc)
               {
                  App.render.renderAll();
                  if(this.curNGVo.comp is INewerGuideCompResize)
                  {
                     (this.curNGVo.comp as INewerGuideCompResize).ngResize();
                  }
                  showArrow(false);
               }
            }
         }
         else if(this.curNGVo && this.curNGVo.isShow && StringUtils.isNull(this.curNGVo.stcVo.talk) == false && this.curNGVo.stcVo.isFindNpc == false)
         {
            this.arrowComp.show(curNGVo.arrowParent,DisplayUtils.localToTarget(ModuleMgr.ins.topEffectLayer,curNGVo.arrowParent,new Point(UIMgr.gameWidth / 2,UIMgr.gameHeight / 2)),new Point(0,0),curNGVo.stcVo,false);
         }
      }
      
      private function initHisotry() : void
      {
         var _loc1_:* = null;
         if(history == null)
         {
            _loc1_ = SettingService.ins.getValue(6);
            if(_loc1_)
            {
               try
               {
                  history = JSON.parse(_loc1_);
               }
               catch(err:Error)
               {
                  Log.fatal(this,"initHisotry error",err);
               }
            }
            try
            {
               if(history == null)
               {
                  history = {};
                  history["guildId"] = {};
                  history["guildId"]["wait"] = [];
                  history["guildId"]["done"] = [];
               }
               return;
            }
            catch(err:Error)
            {
               Log.fatal(this,"initHisotry error",err);
               return;
            }
         }
      }
      
      private function saveStep(param1:StcGuideVo) : void
      {
         if(param1)
         {
            PlayerLogUtil.ins.saveType2(param1.id);
         }
      }
      
      public function isWait(param1:int) : Boolean
      {
         initHisotry();
         var _loc2_:Array = history["guildId"]["wait"];
         return _loc2_.indexOf(param1) > -1;
      }
      
      public function isDone(param1:int) : Boolean
      {
         initHisotry();
         var _loc2_:Array = history["guildId"]["done"];
         return _loc2_.indexOf(param1) > -1;
      }
      
      public function addWait(param1:int) : void
      {
         var _loc2_:int = 0;
         initHisotry();
         var _loc5_:Array = history["guildId"]["wait"];
         var _loc4_:Array = history["guildId"]["done"];
         var _loc3_:StcGuideVo = StcMgr.ins.getGuideVo(param1);
         if(_loc3_)
         {
            _loc2_ = _loc3_.root_id;
         }
         if(_loc4_.indexOf(_loc2_) == -1 && _loc5_.indexOf(_loc2_) == -1 && _loc2_ != 0)
         {
            _loc5_.push(param1);
         }
         saveHistory();
      }
      
      public function removeWait(param1:int) : void
      {
         var _loc4_:int = 0;
         initHisotry();
         var _loc3_:Array = history["guildId"]["wait"];
         var _loc2_:int = _loc3_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            if(isSameRoot(param1,_loc3_[_loc4_]))
            {
               ArrayUtil.removeItemAt(_loc3_,_loc4_);
            }
            _loc4_++;
         }
         saveHistory();
      }
      
      private function removeDone(param1:int) : void
      {
         var _loc4_:int = 0;
         initHisotry();
         var _loc3_:Array = history["guildId"]["done"];
         var _loc2_:int = _loc3_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            if(isSameRoot(param1,_loc3_[_loc4_]))
            {
               ArrayUtil.removeItemAt(_loc3_,_loc4_);
            }
            _loc4_++;
         }
         saveHistory();
      }
      
      private function isSameRoot(param1:int, param2:int) : Boolean
      {
         var _loc4_:StcGuideVo = StcMgr.ins.getGuideVo(param1);
         var _loc3_:StcGuideVo = StcMgr.ins.getGuideVo(param2);
         if(_loc4_ == null || _loc3_ == null)
         {
            return false;
         }
         if(_loc4_.root_id == _loc3_.root_id)
         {
            return true;
         }
         return false;
      }
      
      public function changeWait(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         initHisotry();
         var _loc3_:Array = history["guildId"]["wait"];
         var _loc2_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = _loc3_[_loc5_];
            if(isSameRoot(_loc4_,param1))
            {
               _loc3_[_loc5_] = param1;
            }
            _loc5_++;
         }
         saveHistory();
      }
      
      public function checkHasDone(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         initHisotry();
         var _loc3_:Array = history["guildId"]["wait"];
         var _loc2_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = _loc3_[_loc5_];
            if(isSameRoot(_loc4_,param1))
            {
               return false;
            }
            _loc5_++;
         }
         return isDone(param1);
      }
      
      public function addDone(param1:int) : void
      {
         initHisotry();
         var _loc2_:Array = history["guildId"]["done"];
         if(_loc2_.indexOf(param1) == -1)
         {
            _loc2_.push(param1);
         }
         saveHistory();
      }
      
      private function saveHistory() : void
      {
         var _loc1_:String = JSON.stringify(this.history);
         SettingService.ins.save(6,_loc1_);
      }
   }
}
