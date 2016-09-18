package nslm2.modules.battles.guildDungeons
{
   import nslm2.modules.Chapters.DungeonInfoPanel;
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageNodeVo;
   import game.ui.guildDungeon.render.GuildDungeonBloodUI;
   import morn.customs.components.PanelView;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.StageBtlReport;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import game.ui.commons.icons.WealthRenderS3UI;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.LabelMed;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import com.mz.core.utils.FilterUtil;
   
   public class GuildDungeonInfoPanel extends DungeonInfoPanel implements IObserver
   {
       
      
      private var _stcFamilyStageVo:StcFamilyStageNodeVo;
      
      private var _bloodBar:GuildDungeonBloodUI;
      
      public function GuildDungeonInfoPanel()
      {
         super();
         _bloodBar = new GuildDungeonBloodUI();
         _bloodBar.x = 100;
         _bloodBar.y = 71;
         _bloodBar.scaleX = 0.8;
         this.addChild(_bloodBar);
      }
      
      override public function get panelVideo() : PanelView
      {
         if(_panelVideo == null)
         {
            _panelVideo = new GuildDungeonVideoPanel();
         }
         return _panelVideo;
      }
      
      override public function get panelSaoDang() : PanelView
      {
         if(_panelSaoDang == null)
         {
            _panelSaoDang = new GuildDungeonSaoDangPanel();
         }
         return _panelSaoDang;
      }
      
      override protected function resetTimes() : void
      {
         switchState();
         this.btn_saoDangOnce.label = LocaleMgr.ins.getStr(40400014,[TextFieldUtil.htmlText(1,new TextFormat(null,null,458496))]);
         this.btn_saoDangTen.btnLabel.isHtml = true;
         this.btn_saoDangTen.label = LocaleMgr.ins.getStr(40400014,[TextFieldUtil.htmlText(NpcFuncService.ins.getVo(40720).count,new TextFormat(null,null,458496))]);
      }
      
      override protected function saoDangTen() : void
      {
         if(NpcFuncService.ins.getVo(40720).count <= 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50200102));
         }
         else
         {
            saoDang(NpcFuncService.ins.getVo(40720).count);
         }
      }
      
      override protected function saoDangOnce() : void
      {
         if(NpcFuncService.ins.getVo(40720).count <= 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50200102));
         }
         else
         {
            saoDang(1);
         }
      }
      
      override protected function saoDang(param1:int) : void
      {
         (panelSaoDang as GuildDungeonSaoDangPanel).show(_stcFamilyStageVo);
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
         (panelSaoDang as GuildDungeonSaoDangPanel).start(param1);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(_isSaoDanging)
         {
            (panelSaoDang as GuildDungeonSaoDangPanel).stop();
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
      }
      
      override public function panelFadeOut() : void
      {
         switchEventListeners(false);
         ObserverMgr.ins.unregObserver(this);
         super.panelFadeOut();
      }
      
      public function get stcFamilyStageNodeVo() : StcFamilyStageNodeVo
      {
         return _stcFamilyStageVo;
      }
      
      override public function get stageId() : int
      {
         return stcFamilyStageNodeVo.id;
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc3_:* = null;
         _stcFamilyStageVo = StcMgr.ins.getFamilyStageNodeVo(param1 as int);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(_stcFamilyStageVo.name);
         this.render_gold.visible = false;
         this.render_exp.visible = false;
         this.list_star.visible = false;
         this._fightRender.visible = false;
         this.txt_leftTimes.visible = false;
         this.txt_drops.text = LocaleMgr.ins.getStr(40710516) + "                        " + LocaleMgr.ins.getStr(_stcFamilyStageVo.rewarddes);
         this.txt_shoushaDes.text = LocaleMgr.ins.getStr(40710301);
         var _loc4_:StageBtlReport = GuildDungeonModel.ins.getStageBtlGuideInfo(this.stcFamilyStageNodeVo.id).lastfight;
         if(_loc4_)
         {
            this.txt_shoushaName.text = LinkUtils.playerNameSmart(_loc4_.playerId,_loc4_.name,0);
         }
         else
         {
            this.txt_shoushaName.text = LocaleMgr.ins.getStr(40710501);
         }
         this.txt_des.text = LocaleMgr.ins.getStr(StcMgr.ins.getStageVo(stcFamilyStageNodeVo.stageid).description);
         var _loc2_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(stcFamilyStageNodeVo.npcgroup);
         this.txt_npcName.text = LocaleMgr.ins.getStr(_loc2_.name);
         this.img_icon.skin = UrlLib.headIcon(_loc2_.head_id.toString());
         this.list_item.itemRender = WealthRenderS3UI;
         this.list_item.dataSource = [WealthUtil.createWealthVo(6)];
         if(_stcFamilyStageVo.kind == 2)
         {
            this.box_shoushaExcBuzhen.visible = false;
            this.txt_clear.text = LocaleMgr.ins.getStr(40710303) + "       " + LocaleMgr.ins.getStr(40710501);
            this.txt_leftTimesDes.text = LocaleMgr.ins.getStr(40710509);
            _bloodBar.visible = false;
            this.tsms.toState(2);
         }
         else
         {
            _loc3_ = WealthUtil.costStrToArr(stcFamilyStageNodeVo.lastfight)[0];
            this.txt_clear.text = LocaleMgr.ins.getStr(40710303) + "       " + LocaleMgr.ins.getStr(40710508,[LabelMed.wealthParam(_loc3_.kind,_loc3_.sid,_loc3_.count)]);
            this.txt_leftTimesDes.text = LocaleMgr.ins.getStr(40710511,[_stcFamilyStageVo.killforfamily,_stcFamilyStageVo.killforfund]);
            this.txt_leftTimesDes.commitMeasure();
            this.box_shoushaExcBuzhen.visible = true;
            _bloodBar.progressBar_blood.value = GuildDungeonModel.ins.getNodeLeftHpPer(this.stageId);
            _bloodBar.progressBar_blood.label = LocaleConsts.getNumberAbbr2(GuildDungeonModel.ins.getNodeLeftHp(this.stageId).toString()) + "/" + LocaleConsts.getNumberAbbr2(GuildDungeonModel.ins.getNodeTotalHp(this.stageId).toString());
            _bloodBar.visible = true;
            if(GuildDungeonModel.ins.getNodeInfo(stcFamilyStageNodeVo.id).state == 3)
            {
               this.btn_fight.filters = [FilterUtil.grayFilter()];
            }
            else
            {
               this.btn_fight.filters = null;
            }
            this.tsms.toState(5);
         }
         this.btn_fight.label = LocaleMgr.ins.getStr(40710518);
         resetTimes();
      }
      
      override protected function fight() : void
      {
         switch(int(stcFamilyStageNodeVo.kind) - 1)
         {
            case 0:
               if(GuildDungeonModel.ins.getNodeInfo(stcFamilyStageNodeVo.id).state == 3)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(40710519));
                  return;
               }
               GuildDungeonService.ins.normalFightStart(stcFamilyStageNodeVo.id);
               break;
            case 1:
               GuildDungeonService.ins.yukouFightStart(stcFamilyStageNodeVo.id);
         }
      }
      
      override protected function stop() : void
      {
         if(_isSaoDanging)
         {
            (panelSaoDang as GuildDungeonSaoDangPanel).stop();
            _isSaoDanging = false;
            switchState();
         }
      }
      
      override protected function switchState() : void
      {
         if(_isSaoDanging)
         {
            tsms.toState(3);
         }
         else if(_stcFamilyStageVo.kind == 2)
         {
            tsms.toState(2);
         }
         else
         {
            tsms.toState(5);
         }
      }
   }
}
