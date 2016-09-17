package nslm2.modules.battles.heroAwakenRoad.view
{
   import game.ui.heroAwakenRoad.HeroAwakenMonsterInfoPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import nslm2.modules.battles.heroAwakenRoad.view.saodang.HeroAwakenSaodangPanel;
   import morn.customs.components.BtnRender;
   import morn.customs.components.PanelView;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.battles.heroAwakenRoad.vo.HeroAwakenNodeVo;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.Chapters.ShowStageInfoVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import proto.JueRoadRecordRes;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.ui.components.comps2d.StarUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.battles.heroAwakenRoad.service.HeroAwakenRoadService;
   import proto.JueRoadFightStartRes;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.Chapters.ChapterModuleInitVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.Chapters.IDungeonVideo;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ctrls.TSM;
   
   public class HeroAwakenMonsterInfoPanel extends HeroAwakenMonsterInfoPanelUI implements IObserver
   {
       
      
      public const FIGHTBTN_X:int = 130;
      
      public const FIGHTBTN_X_NOSAODANG:int = 80;
      
      private var _stcStageVo:StcConstellationVo;
      
      private var _panelSaoDang:HeroAwakenSaodangPanel;
      
      private var _isSaoDanging:Boolean;
      
      private var _isShowSaoDang:Boolean;
      
      protected var _resetRender:BtnRender;
      
      protected var _fightRender:BtnRender;
      
      private var _initX:Number = 0;
      
      protected var _panelVideo:PanelView;
      
      protected var tsms:TSMDict;
      
      private var _data:HeroAwakenNodeVo;
      
      public function HeroAwakenMonsterInfoPanel()
      {
         _panelSaoDang = new HeroAwakenSaodangPanel();
         tsms = new TSMDict();
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_click);
         this.panelFadeOutType = 2;
         this.list_star.toolTip = LocaleMgr.ins.getStr(40400023);
         tsms.put(this.btn_saoDangOnce,new TSM(this.btn_saoDangOnce,0).addState(2,{}).addState(5,{
            "alpha":0,
            "y":1000
         }).copyState(3,5));
         tsms.put(this.btn_saoDangTen,new TSM(this.btn_saoDangTen,0).addState(2,{}).addState(5,{
            "alpha":0,
            "y":1000
         }).copyState(3,5));
         tsms.put(this.btn_fight,new TSM(this.btn_fight,0).addState(3,{
            "alpha":0,
            "y":1000
         }).addState(5,{"x":80}).addState(2,{
            "x":130 + 40,
            "alpha":1,
            "y":0
         }));
         tsms.put(this.btn_stop,new TSM(this.btn_stop,0).addState(3,{}).addState(5,{
            "alpha":0,
            "y":1000
         }).copyState(2,5));
      }
      
      public function get model() : HeroAwakenRoadModel
      {
         return HeroAwakenRoadModel.ins;
      }
      
      public function get vo() : StcConstellationVo
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
            _panelVideo = new HeorAwakenVideoPanel();
         }
         return _panelVideo;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            _panelSaoDang.addEventListener("close",saoDangClose);
            panelVideo.addEventListener("close",videoClose);
         }
         else
         {
            _panelSaoDang.removeEventListener("close",saoDangClose);
            panelVideo.removeEventListener("close",videoClose);
         }
      }
      
      private function saoDangClose(param1:Event) : void
      {
         TweenLite.to(this,0.2,{
            "x":_initX,
            "overwrite":false
         });
         DisplayUtils.removeSelf(_panelSaoDang);
         _isShowSaoDang = false;
         _isSaoDanging = false;
         switchState();
      }
      
      private function videoClose(param1:Event) : void
      {
         if(panelVideo)
         {
            this.box_main.visible = true;
            this._panelSaoDang.visible = true;
            DisplayUtils.removeSelf(panelVideo);
         }
      }
      
      public function show(param1:Object = null) : void
      {
         _data = (param1 as ShowStageInfoVo).data as HeroAwakenNodeVo;
         videoClose(null);
         saoDangClose(null);
         _stcStageVo = StcMgr.ins.getConstellationVo(_data.id);
         _panelSaoDang.show(vo);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(_stcStageVo.name);
         this.render_exp.wealthVo = WealthUtil.needVo(10,0,vo.exp);
         this.txt_des.text = LocaleMgr.ins.getStr(vo.descrip);
         updateItems();
         resetTimes();
         var _loc3_:JueRoadRecordRes = model.getStageBtlGuideInfo(stageId);
         if(_loc3_ && _loc3_.shousha)
         {
            txt_shoushaName.text = LinkUtils.playerNameSmart(_loc3_.shousha.id,_loc3_.shousha.name,_loc3_.shousha.dist,ColorLib.getMilitaryColor(_loc3_.shousha.militaryRank));
         }
         else
         {
            this.txt_shoushaName.toolTip = null;
            this.txt_shoushaName.text = LocaleMgr.ins.getStr(40710501);
         }
         var _loc2_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(_stcStageVo.npcgroup);
         this.img_icon.url = UrlLib.headIcon(_loc2_.head_id.toString());
         this.txt_npcName.text = LocaleMgr.ins.getStr(_loc2_.name);
         this.txt_tip.visible = _data.gotStar == 0;
         txt_fightValue.text = LocaleMgr.ins.getStr(41500100) + LocaleConsts.getNumberAbbr2(_data.stcVo.recomability.toString(),99999);
         this.btn_buzhen.btnLabel.width = NaN;
         this.btn_video.btnLabel.width = NaN;
      }
      
      private function updateItems() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:Array = WealthUtil.dropGroupIDToWealthVoArr(vo.drop_id);
         this.list_item.repeatX = _loc2_.length;
         if(_loc2_.length > 4)
         {
            this.list_item.x = 90;
         }
         else
         {
            this.list_item.x = 125;
         }
         this.list_item.dataSource = _loc2_;
      }
      
      private function resetTimes() : void
      {
         switchState();
         this.btn_saoDangOnce.label = LocaleMgr.ins.getStr(40400014,[TextFieldUtil.htmlText(1,new TextFormat(null,null,458496))]);
         this.btn_saoDangTen.btnLabel.isHtml = true;
         this.btn_saoDangTen.label = LocaleMgr.ins.getStr(40400014,[TextFieldUtil.htmlText(10,new TextFormat(null,null,458496))]);
      }
      
      private function switchState() : void
      {
         var _loc1_:* = _data.gotStar == DefindConsts.STAR_MAX;
         if(_isSaoDanging)
         {
            tsms.toState(3);
         }
         else if(!_loc1_)
         {
            this.list_star.visible = true;
            this.list_star.dataSource = StarUtil.starData(_data.gotStar,DefindConsts.STAR_MAX);
            tsms.toState(5);
         }
         else
         {
            tsms.toState(2);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtStageCountChange","evtSaodangCpl","evtFight"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = param1;
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
         else
         {
            resetTimes();
         }
      }
      
      private function btn_click(param1:Button) : void
      {
         var _loc2_:* = param1;
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
               else if(_data.gotStar < DefindConsts.STAR_MAX)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(40400049));
               }
               else if(model.leftCount < 1)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(300007116));
                  AlertUtil.comfirm(new BuyFightCountView());
               }
               else
               {
                  saoDang(1);
               }
            }
            else if(_data.gotStar < DefindConsts.STAR_MAX)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(40400049));
            }
            else if(model.leftCount < 1)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(300007116));
               AlertUtil.comfirm(new BuyFightCountView());
            }
            else
            {
               saoDang(Math.min(model.leftCount,10));
            }
         }
         else
         {
            fight();
         }
      }
      
      protected function fight() : void
      {
         if(_isSaoDanging)
         {
            return;
         }
         model.preStageId = this.stageId;
         if(_data.gotStar > 0 && model.leftCount < 1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300007116));
            AlertUtil.comfirm(new BuyFightCountView());
            return;
         }
         HeroAwakenRoadService.ins.server_jueRoadFightStart(_data.id,model.currentChapterId,startFightHandler);
      }
      
      private function startFightHandler(param1:JueRoadFightStartRes) : void
      {
         if(_data.gotStar > 0)
         {
            model.leftCount--;
            NpcFuncService.ins.changeCount(30121,HeroAwakenRoadModel.ins.leftCount);
         }
         GlobalRef.mainCityReshowParam.heroAwakenRoadModuleInitVo = new ChapterModuleInitVo(this.vo.map_id,0,false);
         ModuleMgr.ins.showModule(30199,param1);
      }
      
      private function saoDang(param1:int) : void
      {
         if(model.leftCount > 0)
         {
            _panelSaoDang.show(vo);
            if(_isShowSaoDang == false)
            {
               _panelSaoDang.x = this.width + 10;
               _panelSaoDang.y = 0;
               TweenLite.to(this,0.2,{"x":_initX - 150});
               _panelSaoDang.panelFadeIn();
               this.addChild(_panelSaoDang);
               _isShowSaoDang = true;
            }
            _isSaoDanging = true;
            tsms.toState(3);
            _panelSaoDang.start(param1);
         }
      }
      
      private function stop() : void
      {
         if(_isSaoDanging)
         {
            _panelSaoDang.stop();
            _isSaoDanging = false;
            switchState();
         }
      }
      
      private function buzhen() : void
      {
         ModuleMgr.ins.showModule(40100,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      protected function video() : void
      {
         (panelVideo as IDungeonVideo).show(stageId);
         panelVideo.x = (this.width - this.panelVideo.width) / 2;
         panelVideo.y = (this.height - this.panelVideo.height) / 2;
         this.box_main.visible = false;
         this._panelSaoDang.visible = false;
         panelVideo.panelFadeIn();
         this.addChild(panelVideo);
      }
      
      public function set initX(param1:Number) : void
      {
         _initX = param1;
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(_isSaoDanging)
         {
            _panelSaoDang.stop();
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
