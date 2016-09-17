package nslm2.modules.funnies.championShip.view
{
   import game.ui.championship.ChampionGambleViewUI;
   import flash.geom.Point;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.funnies.championShip.service.ChampionShipService;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import proto.CompeteStageInfoRes;
   import morn.core.components.Button;
   import com.mz.core.utils.DisplayUtils;
   import proto.CompeteStagePlayerInfo;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import proto.CompeteStageReport;
   import proto.PlayerBaseInfo;
   import nslm2.modules.funnies.championShip.vo.CompeteReportVo;
   import nslm2.utils.TimeUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class ChampionGamblePanel extends ChampionGambleViewUI
   {
      
      private static const AVATAR_POS:Array = [new Point(-190,-50),new Point(190,-50)];
      
      private static const ROUND_NAME:Array = [undefined,LocaleMgr.ins.getStr(999000408),LocaleMgr.ins.getStr(999000409),LocaleMgr.ins.getStr(999000410)];
       
      
      private var panel3D:UIPanel3D;
      
      private var avatars:Array;
      
      private var playerData:Array;
      
      private var service:ChampionShipService;
      
      private var model:ChampionShipModel;
      
      private var gambleIndex:int;
      
      private var data:CompeteStageInfoRes;
      
      public function ChampionGamblePanel()
      {
         avatars = [];
         playerData = [];
         service = ChampionShipService.ins;
         model = ChampionShipModel.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         moduleFadeInType = 0;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("battle_report_module_show");
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         if(param1 == "battle_report_module_show")
         {
            if(param2)
            {
               if(this.panel3D)
               {
                  clear3DObjects();
               }
            }
            else if(this.panel3D == null)
            {
               initPanel3D();
               init3DObjects();
               this.panel3D.visible = true;
            }
         }
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_gamble1 !== _loc2_)
         {
            if(btn_gamble2 === _loc2_)
            {
               gambleIndex = 2;
               service.gamble(model.selectedGroupIndex,model.selectedNodeIndex,1,gambleSuccessHanler);
            }
         }
         else
         {
            gambleIndex = 1;
            service.gamble(model.selectedGroupIndex,model.selectedNodeIndex,0,gambleSuccessHanler);
         }
      }
      
      private function initPanel3D() : void
      {
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
      }
      
      private function init3DObjects() : void
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = data.playerInfos;
         for each(var _loc2_ in data.playerInfos)
         {
            _loc1_ = new Unit3DBase();
            PlayerModel.ins.changePlayerViewByPlayerBaseInfo(_loc1_,_loc2_.baseInfo);
            _loc1_.pos2d = AVATAR_POS[_loc2_.posIndex];
            panel3D.addChild3D(_loc1_);
            if(_loc2_.posIndex == 0)
            {
               _loc1_.rotation = 0;
            }
            else
            {
               _loc1_.rotation = 180;
            }
            avatars.push(_loc1_);
         }
         panel3D.visible = false;
      }
      
      private function gambleSuccessHanler() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(999000411));
         (this["btn_gamble" + gambleIndex] as Button).label = LocaleMgr.ins.getStr(999000412);
         var _loc1_:Boolean = true;
         btn_gamble2.disabled = _loc1_;
         btn_gamble1.disabled = _loc1_;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc12_:* = null;
         var _loc2_:* = null;
         var _loc11_:* = null;
         var _loc13_:int = 0;
         var _loc7_:int = 0;
         this.panelBg.titleImgId = this.moduleId;
         data = param1 as CompeteStageInfoRes;
         this.panelBg.bgCustom.addChild(img_funBg);
         this.initPanel3D();
         var _loc14_:* = false;
         btn_gamble2.disabled = _loc14_;
         btn_gamble1.disabled = _loc14_;
         _loc14_ = LocaleMgr.ins.getStr(50400301);
         btn_gamble2.label = _loc14_;
         btn_gamble1.label = _loc14_;
         if(data.gambleStatus > 0)
         {
            _loc14_ = true;
            btn_gamble2.disabled = _loc14_;
            btn_gamble1.disabled = _loc14_;
            _loc14_ = true;
            tipArea2.mouseEnabled = _loc14_;
            tipArea1.mouseEnabled = _loc14_;
            if(data.gambleStatus == 2)
            {
               _loc14_ = LocaleMgr.ins.getStr(50400705);
               tipArea2.toolTip = _loc14_;
               tipArea1.toolTip = _loc14_;
               txt_errorTip.text = LocaleMgr.ins.getStr(50400705);
            }
            if(data.gambleStatus == 1)
            {
               _loc14_ = LocaleMgr.ins.getStr(50400308,[StcMgr.ins.getGambleVo(99 + model.getRoundIndex(model.selectedNodeIndex)).limit_num]);
               tipArea2.toolTip = _loc14_;
               tipArea1.toolTip = _loc14_;
               txt_errorTip.text = LocaleMgr.ins.getStr(50400308,[StcMgr.ins.getGambleVo(99 + model.getRoundIndex(model.selectedNodeIndex)).limit_num]);
            }
            if(data.gambleStatus == 3)
            {
               _loc14_ = LocaleMgr.ins.getStr(50400307);
               tipArea2.toolTip = _loc14_;
               tipArea1.toolTip = _loc14_;
               txt_errorTip.text = LocaleMgr.ins.getStr(50400307);
            }
         }
         else
         {
            txt_errorTip.text = "";
            _loc14_ = false;
            tipArea2.mouseEnabled = _loc14_;
            tipArea1.mouseEnabled = _loc14_;
         }
         var _loc16_:int = 0;
         var _loc15_:* = data.playerInfos;
         for each(var _loc6_ in data.playerInfos)
         {
            if(_loc6_.posIndex == 0)
            {
               (fightValue1 as FightValueBox).tweenValue = Uint64Util.toInt(_loc6_.baseInfo.ability);
               txt_nameLeft.text = LinkUtils.playerNameSmart(_loc6_.baseInfo.id,_loc6_.baseInfo.name,_loc6_.baseInfo.dist,ColorLib.getMilitaryColor(_loc6_.baseInfo.militaryRank));
               leftScore.num = _loc6_.winTime;
               if(PlayerModel.ins.isCurPlayer(_loc6_.baseInfo.id))
               {
                  btn_gamble1.disabled = true;
                  tipArea1.mouseEnabled = true;
                  tipArea1.toolTip = LocaleMgr.ins.getStr(50400709);
               }
            }
            else
            {
               (fightValue2 as FightValueBox).tweenValue = Uint64Util.toInt(_loc6_.baseInfo.ability);
               txt_nameRight.text = LinkUtils.playerNameSmart(_loc6_.baseInfo.id,_loc6_.baseInfo.name,_loc6_.baseInfo.dist);
               rightScore.num = _loc6_.winTime;
               if(PlayerModel.ins.isCurPlayer(_loc6_.baseInfo.id))
               {
                  btn_gamble2.disabled = true;
                  btn_gamble2.label = LocaleMgr.ins.getStr(50400302);
                  tipArea2.mouseEnabled = true;
                  tipArea2.toolTip = LocaleMgr.ins.getStr(50400709);
               }
            }
            playerData[_loc6_.posIndex] = _loc6_;
         }
         init3DObjects();
         var _loc3_:int = data.reports.length;
         data.reports.sortOn(CompeteStageReport.ROUNDCOUNT.name,16);
         var _loc9_:Array = [];
         _loc12_ = playerData[0];
         _loc2_ = playerData[1];
         var _loc10_:PlayerBaseInfo = new PlayerBaseInfo();
         _loc10_.id = _loc12_.baseInfo.id;
         _loc10_.name = _loc12_.baseInfo.name;
         var _loc8_:PlayerBaseInfo = new PlayerBaseInfo();
         _loc8_.id = _loc2_.baseInfo.id;
         _loc8_.name = _loc2_.baseInfo.name;
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc11_ = data.reports[_loc7_];
            _loc5_ = new CompeteReportVo();
            if(_loc11_.winnerPos == 0)
            {
               _loc13_ = 50400304;
            }
            else
            {
               _loc13_ = 50400305;
            }
            _loc5_.timeStr = "[" + TimeUtils.getFullTimeStr(_loc11_.createTime) + "]";
            _loc5_.battleReportID = _loc11_.reportId;
            _loc5_.infoStr = LocaleMgr.ins.getStr(_loc13_,[_loc11_.roundCount,_loc10_,_loc8_]);
            _loc9_.push(_loc5_);
            _loc7_++;
         }
         gambleIndex = data.gambleIndex;
         if(gambleIndex >= 0)
         {
            (this["btn_gamble" + (gambleIndex + 1)] as Button).label = LocaleMgr.ins.getStr(999000412);
         }
         this.list_reports.dataSource = _loc9_;
         _loc14_ = model.gamleCost;
         this.costRender2.dataSource = _loc14_;
         this.costRender1.dataSource = _loc14_;
         super.preShow();
      }
      
      override public function show(param1:Object = null) : void
      {
         panel3D.visible = true;
         super.show(param1);
      }
      
      private function clear3DObjects() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = avatars;
         for each(var _loc1_ in avatars)
         {
            panel3D.removeChild3D(_loc1_);
            _loc1_.dispose();
            _loc1_ = null;
         }
         avatars = [];
         panel3D.dispose();
         panel3D = null;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(panel3D)
         {
            this.panel3D.dispose();
            this.panel3D = null;
         }
         super.preClose(param1);
      }
   }
}
