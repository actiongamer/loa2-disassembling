package nslm2.modules.Chapters
{
   import game.ui.chapters.DungeonInfoPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import morn.customs.components.BtnRender;
   import morn.customs.components.PanelView;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.Chapters.video.DungeonVideoPanel;
   import nslm2.modules.Chapters.saodang.DungeonSaoDangPanel;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.activities.model.ActivityDropModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import proto.StageBtlReport;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.utils.LabelUtils;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.ui.components.comps2d.StarUtil;
   import morn.core.components.Button;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.handlers.Handler;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.common.globals.GlobalRef;
   import nslm2.mgrs.stcMgrs.consts.StcStageConsts;
   import nslm2.modules.battles.battleResults.BattleResultGlobel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.StageResetReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.MouseEvent;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ctrls.TSM;
   
   public class DungeonInfoPanel extends DungeonInfoPanelUI implements IObserver, INewerGuideGetComp
   {
       
      
      public const FIGHTBTN_X:int = 130;
      
      public const FIGHTBTN_X_NOSAODANG:int = 80;
      
      public const IMG_DUNGEON:String = "img_dungeon";
      
      protected var _stcStageVo:StcStageVo;
      
      protected var _isShowSaoDang:Boolean;
      
      protected var _isSaoDanging:Boolean;
      
      protected var _resetRender:BtnRender;
      
      protected var _fightRender:BtnRender;
      
      protected var _initX:Number = 0;
      
      protected var _panelVideo:PanelView;
      
      protected var _panelSaoDang:PanelView;
      
      protected var tsms:TSMDict;
      
      public function DungeonInfoPanel()
      {
         tsms = new TSMDict();
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_click);
         this.panelFadeOutType = 0;
         _resetRender = new BtnRender();
         this.btn_reset.addChild(_resetRender);
         _fightRender = new BtnRender();
         this.btn_fight.addChild(_fightRender);
         this.list_star.toolTip = LocaleMgr.ins.getStr(40400023);
         tsms.put(this.btn_saoDangOnce,new TSM(this.btn_saoDangOnce,0).addState(2,{}).addState(5,{
            "alpha":0,
            "y":1000
         }).copyState(3,5).copyState(4,5));
         tsms.put(this.btn_saoDangTen,new TSM(this.btn_saoDangTen,0).addState(2,{}).addState(5,{
            "alpha":0,
            "y":1000
         }).copyState(3,5).copyState(4,5));
         tsms.put(this.btn_fight,new TSM(this.btn_fight,0).copyState(3,{}).addState(5,{"x":80}).addState(2,{"x":130 + 40}).addState(4,{
            "alpha":0,
            "y":1000
         }));
         tsms.put(this.btn_reset,new TSM(this.btn_reset,0).addState(4,{})).addState(5,{
            "alpha":0,
            "y":1000
         }).copyState(2,5).copyState(3,5);
         tsms.put(this.btn_stop,new TSM(this.btn_stop,0).addState(3,{}).addState(5,{
            "alpha":0,
            "y":1000
         }).copyState(2,5).copyState(4,5));
      }
      
      public function get model() : ChapterModel
      {
         return ChapterModel.ins;
      }
      
      public function get vo() : StcStageVo
      {
         return _stcStageVo;
      }
      
      public function get stageId() : int
      {
         return vo.id;
      }
      
      public function get panelVideo() : PanelView
      {
         if(_panelVideo == null)
         {
            _panelVideo = new DungeonVideoPanel();
         }
         return _panelVideo;
      }
      
      public function get panelSaoDang() : PanelView
      {
         if(_panelSaoDang == null)
         {
            _panelSaoDang = new DungeonSaoDangPanel();
         }
         return _panelSaoDang;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            panelSaoDang.addEventListener("close",saoDangClose);
            panelVideo.addEventListener("close",videoClose);
         }
         else
         {
            panelSaoDang.removeEventListener("close",saoDangClose);
            panelVideo.removeEventListener("close",videoClose);
         }
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         if(param1 == "btn_close")
         {
            return this.panelBg.btn_close;
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      protected function saoDangClose(param1:Event) : void
      {
         TweenLite.to(this,0.2,{
            "x":_initX,
            "overwrite":false
         });
         DisplayUtils.removeSelf(panelSaoDang);
         _isShowSaoDang = false;
         _isSaoDanging = false;
      }
      
      protected function videoClose(param1:Event) : void
      {
         if(panelVideo)
         {
            this.box_main.visible = true;
            this.panelSaoDang.visible = true;
            DisplayUtils.removeSelf(panelVideo);
         }
      }
      
      public function show(param1:Object = null) : void
      {
         var _loc6_:* = null;
         videoClose(null);
         saoDangClose(null);
         _stcStageVo = StcMgr.ins.getStageVo(param1 as int);
         model.nowShowinginfoId = param1 as int;
         (panelSaoDang as DungeonSaoDangPanel).show(vo);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(_stcStageVo.name);
         this.render_gold.wealthVo = WealthUtil.needVo(1,0,vo.reward_coin);
         this.render_exp.wealthVo = WealthUtil.needVo(10,0,vo.reward_exp);
         this.txt_des.text = LocaleMgr.ins.getStr(vo.description);
         var _loc4_:Array = WealthUtil.dropGroupIDToWealthVoArr(vo.front_end_drop_id);
         if(_stcStageVo.kind == 3)
         {
            _loc6_ = ActivityDropModel.ins.getActivityDropWealthArray(40408);
         }
         else
         {
            _loc6_ = ActivityDropModel.ins.getActivityDropWealthArray(40400);
         }
         var _loc2_:Array = _loc4_.concat(_loc6_);
         if(_loc2_.length > 4)
         {
            this.list_item.repeatX = 5;
            this.list_item.x = 90;
         }
         else
         {
            this.list_item.repeatX = 4;
            this.list_item.x = 125;
         }
         this.list_item.dataSource = _loc2_;
         resetTimes();
         _fightRender.changeView(UrlLib.itemMiniIcon(2),LocaleMgr.ins.getStr(40400015,[TextFieldUtil.htmlText(vo.drain_stamina,new TextFormat(null,null,458496))]));
         var _loc5_:StageBtlReport = model.getStageBtlGuideInfo(stageId).shousha;
         if(_loc5_)
         {
            if(Uint64Util.equal(_loc5_.playerId,PlayerModel.ins.playerInfo.id))
            {
               this.txt_shoushaName.text = _loc5_.name;
            }
            else
            {
               this.txt_shoushaName.text = LinkUtils.playerName(_loc5_.playerId,_loc5_.name,0,12798193);
            }
            this.txt_shoushaName.toolTip = _loc5_;
         }
         else
         {
            this.txt_shoushaName.toolTip = null;
            this.txt_shoushaName.text = LocaleMgr.ins.getStr(40710501);
         }
         var _loc3_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(_stcStageVo.icon_id);
         this.img_icon.url = UrlLib.headIcon(_loc3_.head_id.toString());
         this.txt_npcName.text = LocaleMgr.ins.getStr(_loc3_.name);
         if(_stcStageVo.kind == 3)
         {
            if(ClientConfig.isChineseLang())
            {
               addChild(new VipHintBox(10110,150,310));
            }
            else
            {
               addChild(new VipHintBox(10110,108,329));
            }
         }
      }
      
      protected function resetTimes() : void
      {
         var _loc1_:int = 0;
         switchState();
         if(model.getStageInfo(stageId))
         {
            _loc1_ = ChapterModel.ins.getStageResetDiamond(stageId);
            _resetRender.changeView(UrlLib.itemMiniIcon(3),LocaleMgr.ins.getStr(40400019,[_loc1_]));
         }
         this.txt_leftTimes.text = LabelUtils.leaveMaxStr(vo.daily_free_time - model.getStageInfoCount(stageId),vo.daily_free_time);
         this.btn_saoDangOnce.label = LocaleMgr.ins.getStr(40400014,[TextFieldUtil.htmlText(1,new TextFormat(null,null,458496))]);
         this.btn_saoDangTen.btnLabel.isHtml = true;
         this.btn_saoDangTen.label = LocaleMgr.ins.getStr(40400014,[TextFieldUtil.htmlText(Math.min(model.getLeftInfoCount(stageId),10),new TextFormat(null,null,458496))]);
         var _loc2_:uint = 0;
         if(ChapterModel.ins.getStageInfo(_stcStageVo.id))
         {
            _loc2_ = ChapterModel.ins.getStageInfo(_stcStageVo.id).resetCount;
         }
         var _loc3_:int = ChapterModel.ins.getStageMaxResetTimes(stageId);
         if(PlayerModel.ins.vip == 0)
         {
            this.label_reset.visible = false;
         }
         else
         {
            this.label_reset.text = LocaleMgr.ins.getStr(30100347,[_loc3_ - _loc2_,_loc3_]);
         }
      }
      
      protected function switchState() : void
      {
         if(_isSaoDanging)
         {
            tsms.toState(3);
         }
         else if(model.getLeftInfoCount(stageId) <= 0)
         {
            tsms.toState(4);
         }
         else if(model.getStageInfoStar(stageId) < DefindConsts.STAR_MAX)
         {
            if(vo.kind == 1)
            {
               this.list_star.visible = false;
            }
            else if(this.model.cplIdArr.indexOf(stageId) != -1)
            {
               this.list_star.visible = true;
               this.list_star.dataSource = StarUtil.starData(model.getStageInfoStar(stageId),DefindConsts.STAR_MAX);
            }
            else
            {
               this.list_star.visible = false;
            }
            tsms.toState(5);
         }
         else
         {
            tsms.toState(2);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtStageCountChange","evtSaodangCpl","evtFight","MSG_NPC_FUNC_VO_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" !== _loc4_)
         {
            if("evtStageCountChange" !== _loc4_)
            {
               if("evtSaodangCpl" !== _loc4_)
               {
                  if("evtFight" === _loc4_)
                  {
                     _loc3_ = param2 as int;
                     if(_loc3_ == this.stageId)
                     {
                        fight();
                     }
                  }
               }
               else
               {
                  _isSaoDanging = false;
                  resetTimes();
                  NGUtil.checkModuleShow(40407,this);
               }
            }
            addr49:
            return;
         }
         resetTimes();
         §§goto(addr49);
      }
      
      protected function btn_click(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_reset !== _loc2_)
         {
            if(this.btn_fight !== _loc2_)
            {
               if(this.btn_saoDangTen !== _loc2_)
               {
                  if(this.btn_saoDangOnce !== _loc2_)
                  {
                     if(this.btn_stop !== _loc2_)
                     {
                        if(this.btn_buzhen !== _loc2_)
                        {
                           if(this.btn_video === _loc2_)
                           {
                              video();
                           }
                        }
                        else
                        {
                           buzhen();
                        }
                     }
                     else
                     {
                        stop();
                     }
                  }
                  else
                  {
                     saoDangOnce();
                  }
               }
               else
               {
                  saoDangTen();
               }
            }
            else
            {
               fight();
            }
         }
         else
         {
            reset();
         }
      }
      
      protected function saoDangTen() : void
      {
         var _loc1_:StcFunctionVo = StcMgr.ins.getFunctionVo(40403);
         if(!FuncOpenAutoCtrl.checkOpen(40403))
         {
            AlertUtil.lackLevel(_loc1_.level);
         }
         else if(model.getStageInfoStar(stageId) < DefindConsts.STAR_MAX)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40400049));
         }
         else
         {
            saoDang(Math.min(model.getLeftInfoCount(stageId),10));
         }
      }
      
      protected function saoDangOnce() : void
      {
         var _loc1_:StcFunctionVo = StcMgr.ins.getFunctionVo(40403);
         _loc1_ = StcMgr.ins.getFunctionVo(40403);
         if(!FuncOpenAutoCtrl.checkOpen(40403))
         {
            AlertUtil.lackLevel(_loc1_.level);
         }
         else if(model.getStageInfoStar(stageId) < DefindConsts.STAR_MAX)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40400049));
         }
         else
         {
            saoDang(1);
         }
      }
      
      protected function reset() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         if(ChapterModel.ins.getStageInfo(stageId).resetCount >= ChapterModel.ins.getStageMaxResetTimes(stageId))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(40400048));
         }
         else
         {
            _loc1_ = uint(ChapterModel.ins.getStageInfo(this.vo.id).resetCount);
            _loc2_ = uint(ChapterModel.ins.getStageMaxResetTimes(stageId) - _loc1_);
            AlertUtil.comfirm(LocaleMgr.ins.getStr(40400008,[TextFieldUtil.htmlText(ChapterModel.ins.getStageResetDiamond(this.vo.id),new TextFormat(null,null,LabelUtils.getCountNeedColor(PlayerModel.ins.gold,20))),TextFieldUtil.htmlText(_loc2_,new TextFormat(null,null,458496))]),new Handler(stageReset,[vo]),null,null,null,null,0,true,_stcStageVo.kind == 3?10110:10100);
         }
      }
      
      protected function fight() : void
      {
         var _loc1_:* = null;
         if(_isSaoDanging)
         {
            return;
         }
         if(ChapterModel.ins.canEnterStage(this.stageId) == false)
         {
            return;
         }
         ChapterModel.ins.preStageId = this.stageId;
         _loc1_ = new DungeonVo(this.stageId);
         GlobalRef.mainCityReshowParam.chapterModuleInitVo = new ChapterModuleInitVo(this.vo.chapter_id,0,false);
         GlobalRef.mainCityReshowParam.lastAttackChapterId = this.vo.chapter_id;
         if(StcStageConsts.isNormalDgStage(this.stageId))
         {
            BattleResultGlobel.ins.doubleId = 1012;
         }
         else
         {
            BattleResultGlobel.ins.doubleId = 1013;
         }
         ModuleMgr.ins.showModule(40300,{"vo":_loc1_});
      }
      
      protected function saoDang(param1:int) : void
      {
         if(ChapterModel.ins.canEnterStage(this.stageId) == false)
         {
            return;
         }
         if(model.getLeftInfoCount(stageId) > 0)
         {
            (panelSaoDang as DungeonSaoDangPanel).show(vo);
            if(_isShowSaoDang == false)
            {
               panelSaoDang.x = this.width + 10;
               panelSaoDang.y = 0;
               TweenLite.to(this,0.2,{"x":_initX - 150});
               panelSaoDang.panelFadeIn();
               this.addChild(panelSaoDang);
               _isShowSaoDang = true;
            }
            _isSaoDanging = true;
            tsms.toState(3);
            (panelSaoDang as DungeonSaoDangPanel).start(param1);
         }
      }
      
      protected function stop() : void
      {
         if(_isSaoDanging)
         {
            (panelSaoDang as DungeonSaoDangPanel).stop();
            _isSaoDanging = false;
            switchState();
         }
      }
      
      protected function buzhen() : void
      {
         ModuleMgr.ins.showModule(40100,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      protected function video() : void
      {
         (panelVideo as IDungeonVideo).show(stageId);
         panelVideo.x = (this.width - this.panelVideo.width) / 2;
         panelVideo.y = (this.height - this.panelVideo.height) / 2;
         this.box_main.visible = false;
         this.panelSaoDang.visible = false;
         panelVideo.panelFadeIn();
         this.addChild(panelVideo);
      }
      
      protected function stageReset(param1:StcStageVo) : void
      {
         var _loc2_:StageResetReq = new StageResetReq();
         _loc2_.stageId = param1.id;
         ServerEngine.ins.send(8060,_loc2_,server_stageReset);
      }
      
      protected function server_stageReset() : void
      {
         ChapterModel.ins.minusStageInfoCount(this.stageId);
         ChapterModel.ins.addStageResetCount(this.stageId);
         ObserverMgr.ins.sendNotice("evtStageCountChange");
      }
      
      public function set initX(param1:Number) : void
      {
         _initX = param1;
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(_isSaoDanging)
         {
            (panelSaoDang as DungeonSaoDangPanel).stop();
            _isSaoDanging = false;
         }
         super.btnCloseHandler(param1);
      }
      
      override public function panelFadeIn() : void
      {
         switchEventListeners(true);
         ObserverMgr.ins.regObserver(this);
      }
      
      override protected function panelFadeInCpl() : void
      {
         super.panelFadeInCpl();
         this.commitMeasure();
         NGUtil.checkModuleShow(40407,this);
      }
      
      override public function panelFadeOut() : void
      {
         switchEventListeners(false);
         ObserverMgr.ins.unregObserver(this);
         super.panelFadeOut();
      }
      
      override public function dispose() : void
      {
         model.nowShowinginfoId = 0;
         if(this.isDisposed)
         {
            return;
         }
         if(_panelSaoDang)
         {
            _panelSaoDang.dispose();
            _panelSaoDang = null;
         }
         if(_panelVideo)
         {
            _panelVideo.dispose();
            _panelVideo = null;
         }
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
