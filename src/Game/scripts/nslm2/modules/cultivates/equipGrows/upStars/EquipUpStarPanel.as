package nslm2.modules.cultivates.equipGrows.upStars
{
   import game.ui.equipGrows.upStars.EquipUpStarPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.equipGrows.commons.IEquipGrowSubPanel;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.modules.cultivates.equipGrows.EquipGrowModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAddStarVo;
   import flash.display.Sprite;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import proto.EquipAddStarReq;
   import nslm2.common.model.PlayerModel;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import proto.EquipAddStarRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import game.ui.roleInfos.NpcPropVo;
   import com.greensock.TweenLite;
   import nslm2.mgrs.SoundMgr;
   import flash.display.Bitmap;
   import morn.core.components.VBox;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import nslm2.common.consts.NPCPropConsts;
   import flash.display.BitmapData;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.LabelUtils;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS2;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import morn.customs.components.ClipList;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class EquipUpStarPanel extends EquipUpStarPanelUI implements IObserver, IEquipGrowSubPanel, IViewStackPage
   {
       
      
      private var weapon:UIWeapon3D;
      
      private var model:EquipGrowModel;
      
      private var lastStar:uint;
      
      private var starUpEff:BmcSpriteSheet;
      
      private const PROGRESS_LENGTH:int = 402;
      
      private const PROGRESS_INITX:int = 41;
      
      private var nowData:Array;
      
      private var nextData:Array;
      
      private var $stcItemVo:StcItemVo;
      
      private var $stcStar:StcEquipAddStarVo;
      
      private var refreshFlag:Boolean;
      
      private var lastExp:uint;
      
      private var _mannalPanel:nslm2.modules.cultivates.equipGrows.upStars.EquipUpStarMannalPanel;
      
      private var tempValue:int = 0;
      
      private var critEff:BmcSpriteSheet;
      
      private var lineEff:BmcSpriteSheet;
      
      private var starsEff:BmcSpriteSheet;
      
      private var $lastStcStar:StcEquipAddStarVo;
      
      private var lastPiece:int;
      
      private var black_bg:Sprite;
      
      private var equipEff:BmcSpriteSheet;
      
      private var quadraKill:uint;
      
      private var doubleKill:uint;
      
      private var _taskAlertRender:TaskAlertRenderS2;
      
      private var selectEff:BmcSpriteSheet;
      
      public function EquipUpStarPanel()
      {
         super();
         model = EquipGrowModel.ins;
         model.RedPieceHint = false;
         this.label_hint1.text = LocaleMgr.ins.getStr(30006300);
         this.label_hint2.text = LocaleMgr.ins.getStr(91000002);
         this.label_hint2.visible = false;
         this.label_perc.text = LocaleMgr.ins.getStr(999000829,[VipModel.ins.getVipValue(11100) * 100]);
         box_avail.addChild(new VipHintBox(11100,241,label_perc.y - 2));
         this.btn_once.clickHandler = !!model.RedPieceHint?upStar:upStarHint;
         this.btn_multi.clickHandler = !!model.RedPieceHint?upStarMulti:upStarMultiHint;
         var _loc1_:ProgressBarCtrl = new ProgressBarCtrl(this.progress);
         this.parts.push(_loc1_);
         this.btn_mannal.clickHandler = mannualHandler;
         box_need.addEventListener("click",showGetFrom);
         box_need.buttonMode = true;
         box_redNeed.selectHandler = radioHandler;
         needRes1.addEventListener("click",showGetFrom);
         needRes1.buttonMode = true;
         needRes1.txt_num.mouseEvent = false;
         needRes1.mouseChildren = false;
         needRes2.addEventListener("click",showGetFrom);
         needRes2.buttonMode = true;
         needRes2.mouseChildren = false;
         needRes2.txt_num.mouseEvent = false;
         needRes3.addEventListener("click",showGetFrom);
         needRes3.buttonMode = true;
         needRes3.mouseChildren = false;
         needRes3.txt_num.mouseEvent = false;
         this.label_nextExtraProp.text = LocaleMgr.ins.getStr(30006304).split("：")[0];
      }
      
      private function upStarHint() : void
      {
         if($stcItemVo.quality == 6 && box_redNeed.selectedIndex == 2)
         {
            model.RedPieceHint = true;
            this.btn_once.clickHandler = upStar;
            this.btn_multi.clickHandler = upStarMulti;
            AlertUtil.comfirm(LocaleMgr.ins.getStr(13100738),null,selectOrange);
         }
         else
         {
            upStar();
         }
      }
      
      private function selectOrange() : void
      {
         box_redNeed.selectedIndex = 0;
      }
      
      private function upStarMultiHint() : void
      {
         if($stcItemVo.quality == 6 && box_redNeed.selectedIndex == 2)
         {
            model.RedPieceHint = true;
            this.btn_once.clickHandler = upStar;
            this.btn_multi.clickHandler = upStarMulti;
            AlertUtil.comfirm(LocaleMgr.ins.getStr(13100738),null,selectOrange);
         }
         else
         {
            upStarMulti();
         }
      }
      
      private function radioHandler() : void
      {
         if(!selectEff)
         {
            selectEff = new BmcSpriteSheet();
            selectEff.init(115002,1,"all",true);
            selectEff.y = box_redNeed.y - 9;
            selectEff.scaleX = 0.25;
            selectEff.scaleY = 0.8;
            this.box_avail.addChild(selectEff);
         }
         selectEff.x = box_redNeed.x - 0 + (44 + box_redNeed.selectedIndex * 122);
      }
      
      private function showGetFrom(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.currentTarget;
         if(box_need !== _loc3_)
         {
            if(needRes1 !== _loc3_)
            {
               if(needRes2 !== _loc3_)
               {
                  if(needRes3 === _loc3_)
                  {
                     _loc2_ = getWealthVo(0,true);
                  }
               }
               else
               {
                  _loc2_ = getWealthVo(1);
               }
            }
            else
            {
               _loc2_ = getWealthVo(0);
            }
         }
         else
         {
            _loc2_ = getWealthVo(0);
         }
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(_loc2_.kind,_loc2_.stcItemVo.id),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function mannualHandler() : void
      {
         if(_mannalPanel)
         {
            disposeTianfuPanel();
         }
         else
         {
            _mannalPanel = new nslm2.modules.cultivates.equipGrows.upStars.EquipUpStarMannalPanel();
            _mannalPanel.show();
            _mannalPanel.x = -34;
            _mannalPanel.y = -3;
            _mannalPanel.addEventListener("close",disposeTianfuPanel);
            _mannalPanel.panelFadeIn();
            addChild(_mannalPanel);
         }
      }
      
      private function disposeTianfuPanel(... rest) : void
      {
         if(_mannalPanel)
         {
            _mannalPanel.removeEventListener("close",disposeTianfuPanel);
            _mannalPanel.panelFadeOutAndDispose();
            _mannalPanel = null;
         }
      }
      
      private function upStarMulti() : void
      {
         this.lastExp = model.item.starExp;
         this.lastStar = model.item.star;
         var _loc3_:EquipAddStarReq = new EquipAddStarReq();
         _loc3_.heroId = model.heroInfo.baseInfo.id;
         _loc3_.equipId = model.item.id;
         _loc3_.red = (box_redNeed.selectedIndex == 2 || $stcStar.cost == "0") && $stcItemVo.quality == 6;
         var _loc1_:WealthVo = getCurSelWealthVo();
         _loc3_.materialNo = _loc1_.itemId;
         var _loc2_:int = PlayerModel.ins.getCountByWealthVo(_loc1_);
         this.lastPiece = _loc2_ > 10?10:_loc2_;
         _loc3_.count = 10;
         ServerEngine.ins.send(6602,_loc3_,upStarCplHandler,upStarErr);
         this.btn_multi.disabled = true;
         this.btn_once.disabled = true;
      }
      
      private function upStar() : void
      {
         this.lastExp = model.item.starExp;
         this.lastStar = model.item.star;
         var _loc2_:EquipAddStarReq = new EquipAddStarReq();
         _loc2_.heroId = model.heroInfo.baseInfo.id;
         _loc2_.equipId = model.item.id;
         _loc2_.red = (box_redNeed.selectedIndex == 2 || $stcStar.cost == "0") && $stcItemVo.quality == 6;
         var _loc1_:WealthVo = getCurSelWealthVo();
         _loc2_.materialNo = _loc1_.itemId;
         this.lastPiece = 1;
         _loc2_.count = 1;
         ServerEngine.ins.send(6602,_loc2_,upStarCplHandler,upStarErr);
         this.btn_multi.disabled = true;
         this.btn_once.disabled = true;
      }
      
      private function upStarErr(param1:ProtocolStatusRes) : void
      {
         this.btn_multi.disabled = false;
         this.btn_once.disabled = false;
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      private function upStarCplHandler(param1:EquipAddStarRes) : void
      {
         this.doubleKill = param1.doubleKill;
         this.quadraKill = param1.quadraKill;
         if(param1.star > this.lastStar)
         {
            $stcStar = StcMgr.ins.getVoByMultiColumnValue("static_equip_add_star",["equipId","star"],[model.item.itemId,model.item.star]);
            $lastStcStar = StcMgr.ins.getVoByMultiColumnValue("static_equip_add_star",["equipId","star"],[model.item.itemId,model.item.star - 1]);
            refreshFlag = true;
            playCompleteEff();
            ObserverMgr.ins.sendNotice("REFRESH_WEAPON_3D");
         }
         else
         {
            playEff(false);
         }
      }
      
      private function showText() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = false;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(refreshFlag)
         {
            _loc4_ = $lastStcStar.totalstep - this.lastExp;
         }
         else
         {
            _loc4_ = model.item.starExp - this.lastExp;
         }
         if($stcItemVo.quality == 6 && box_redNeed.selectedIndex == 2)
         {
            _loc2_ = Number(_loc4_ / $stcStar.addstepbyred - lastPiece) > 0;
         }
         else
         {
            _loc2_ = Number(_loc4_ / $stcStar.addstrep - lastPiece) > 0;
         }
         if(_loc2_)
         {
            _loc3_ = "";
            if(_loc4_ > 9)
            {
               _loc3_ = TextFieldUtil.htmlText(doubleKill > 0?LocaleMgr.ins.getStr(30006305,[this.doubleKill]):"",new TextFormat(null,null,12798193)) + "  " + TextFieldUtil.htmlText(quadraKill > 0?LocaleMgr.ins.getStr(30006310,[this.quadraKill]):"",new TextFormat(null,null,16542720));
            }
            else if(quadraKill > 0)
            {
               _loc3_ = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30006310,[this.quadraKill]).split("x")[0],new TextFormat(null,null,16542720));
            }
            else if(doubleKill > 0)
            {
               _loc3_ = TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30006305,[this.doubleKill]).split("x")[0],new TextFormat(null,null,12798193));
            }
            AlertUtil.float(_loc3_,DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,DisplayUtils.globarCenter(this.box_curTitle),1);
            playCritalEff();
         }
         _loc1_ = NpcPropVo.parseStarArrStr($stcStar,model.item.starExp,"+");
         _loc1_.forEach(setFloatPos);
         this.list_prop.repeatY = _loc1_.length;
         this.list_prop.dataSource = _loc1_;
         this.list_prop.commitMeasure();
         if(refreshFlag)
         {
            TweenLite.delayedCall(0.5,liansuoLevelUpHandler);
         }
         refreshNeedRender();
         refreshBtn();
         refreshFlag = false;
         AlertUtil.float(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30006306,[_loc4_]),new TextFormat(null,20,458496)),DisplayUtils.globarCenter(this).add(new Point(0,-50)),18,!!refreshFlag?null:refreshPanel,DisplayUtils.globarCenter(this.list_prop.cells[0].txt_value),1);
      }
      
      private function refreshBtn() : void
      {
         if($stcStar.totalstep == 0)
         {
            this.btn_multi.disabled = true;
            this.btn_once.disabled = true;
         }
         else
         {
            this.btn_multi.disabled = false;
            this.btn_once.disabled = false;
         }
      }
      
      private function playCritalEff() : void
      {
         if(!critEff)
         {
            critEff = new BmcSpriteSheet();
            critEff.init(5006);
            critEff.x = 146;
            critEff.y = 20;
            addChild(critEff);
            SoundMgr.ins.playTexiaoSound("zhuangBeiQiangHuaBaoJi");
         }
         else
         {
            critEff.init(5006);
            SoundMgr.ins.playTexiaoSound("zhuangBeiQiangHuaBaoJi");
         }
      }
      
      private function setFloatPos(param1:NpcPropVo, param2:int, param3:Array) : void
      {
         param1.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50 + tempValue));
      }
      
      private function playCompleteEff() : void
      {
         var _loc1_:Number = 1 - this.progress.value;
         TweenLite.to(this.progress,0.2 * _loc1_,{
            "value":1,
            "onComplete":playComplete2dEff
         });
      }
      
      private function playComplete2dEff(param1:int = 0) : void
      {
         if(!starUpEff)
         {
            starUpEff = new BmcSpriteSheet();
            starUpEff.init(10170001,1,"all",false,1,0,null,true);
            starUpEff.x = this.list_stars.x + 44 * (model.item.star + param1) - 122;
            starUpEff.y = this.list_stars.y + 57;
            addChild(starUpEff);
         }
         else
         {
            starUpEff.x = this.list_stars.x + 44 * (model.item.star + param1) - 122;
            starUpEff.init(10170001,1,"all",false,1,0,null,true);
         }
         playEff();
      }
      
      private function liansuoLevelUpHandler() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(!lineEff)
         {
            lineEff = new BmcSpriteSheet();
            lineEff.init(5003);
            lineEff.x = 46;
            lineEff.y = 135;
            addChild(lineEff);
         }
         else
         {
            lineEff.init(5003);
         }
         _loc2_ = LocaleMgr.ins.getStr(30500017,[TextFieldUtil.htmlText(_loc3_,new TextFormat(null,null,458496))]);
         if(!$stcStar)
         {
            return;
         }
         var _loc1_:Array = NpcPropVo.parseArrStr($stcStar.extra_property,"+");
         var _loc4_:Bitmap = getTipBmp(_loc2_,_loc1_);
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(_loc4_);
         _loc4_.x = -_loc4_.width >> 1;
         _loc4_.y = -_loc4_.height >> 1;
         _loc5_.x = 504;
         _loc5_.y = 245 + _loc5_.height / 2;
         addChild(_loc5_);
         TweenLite.from(_loc5_,0.2,{"alpha":0});
         TweenLite.to(_loc5_,0.3,{
            "delay":1,
            "scaleX":2,
            "scaleY":2,
            "alpha":0,
            "y":_loc5_.y - 30,
            "onComplete":tweenComplete,
            "onCompleteParams":[_loc5_,_loc4_]
         });
      }
      
      private function getTipBmp(param1:String, param2:Array) : Bitmap
      {
         var _loc5_:* = null;
         AlertUtil.float(LocaleMgr.ins.getStr(91000000,[$stcItemVo.id,model.item.star]),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,DisplayUtils.globarCenter(this.list_stars),1);
         AlertUtil.float(LocaleMgr.ins.getStr(30006304),DisplayUtils.globarCenter(this).add(new Point(0,-50)),-1,null,DisplayUtils.globarCenter(this.list_stars),1);
         var _loc7_:VBox = new VBox();
         _loc7_.space = 4;
         _loc7_.align = "center";
         var _loc6_:Label = new Label();
         _loc6_.isHtml = true;
         _loc6_.color = 16777215;
         _loc6_.stroke = "0x0";
         _loc6_.labelFilterKind = "黑色1像素描边";
         _loc6_.size = 24;
         _loc6_.text = param1;
         _loc7_.addChild(_loc6_);
         var _loc9_:Box = new Box();
         _loc9_.height = 8;
         _loc7_.addChild(_loc9_);
         var _loc11_:int = 0;
         var _loc10_:* = param2;
         for each(var _loc8_ in param2)
         {
            _loc5_ = new Label();
            _loc5_.size = 16;
            _loc5_.color = 3997440;
            _loc5_.labelFilterKind = "黑色1像素描边";
            _loc5_.text = NPCPropConsts.ins.getLocaleName(_loc8_.propId) + " +" + _loc8_.value;
            _loc7_.addChild(_loc5_);
            AlertUtil.showPropChangeTip(NPCPropConsts.ins.getLocaleNameNormal(_loc8_.propId),_loc8_.value,param2.indexOf(_loc8_) == param2.length - 1?refreshPanel:null,DisplayUtils.globarCenter(this.list_stars),DisplayUtils.globarCenter(this).add(new Point(0,-50)));
         }
         var _loc3_:BitmapData = new BitmapData(_loc7_.width,_loc7_.height,true,0);
         var _loc4_:Bitmap = new Bitmap(_loc3_);
         return _loc4_;
      }
      
      private function playeStarsMoveEff() : void
      {
         if(!starsEff)
         {
            starsEff = new BmcSpriteSheet();
            starsEff.init(5004);
            starsEff.x = 256;
            starsEff.y = 105;
            addChild(starsEff);
         }
         else
         {
            starsEff.init(5004);
         }
      }
      
      private function tweenComplete(param1:Sprite, param2:Bitmap) : void
      {
         if(!param2)
         {
            param2.bitmapData.dispose();
            param2 = null;
         }
         DisplayUtils.removeSelf(param1);
      }
      
      private function playEff(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if($stcStar)
         {
            if(param1)
            {
               this.progress.value = 0;
            }
            if(this.$stcStar.totalstep != 0)
            {
               _loc2_ = model.item.starExp / $stcStar.totalstep;
               _loc3_ = this.progress.value;
               this.txt_progress.text = model.item.starExp + "/" + $stcStar.totalstep;
               TweenLite.to(this.progress,0.2 * (_loc2_ - _loc3_),{
                  "value":_loc2_,
                  "onComplete":showText
               });
            }
            else
            {
               this.box_progress.visible = false;
               this.label_hint2.visible = true;
               showText();
            }
         }
         if(!equipEff)
         {
            equipEff = new BmcSpriteSheet();
            equipEff.init(10170002);
            equipEff.x = 100;
            addChild(equipEff);
         }
         else
         {
            equipEff.init(10170002);
         }
         refreshStar();
      }
      
      private function refreshStar() : void
      {
         var _loc1_:Array = EquipGrowModel.getStarLightArray(model.item.star,$stcItemVo.quality,"StarFromLeftToRight",false);
         this.list_stars.repeatX = _loc1_.length;
         this.list_stars.dataSource = _loc1_;
      }
      
      public function refreshNeedRender() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if($stcStar == null)
         {
            return;
         }
         if($stcItemVo.quality != 6 || $stcItemVo.quality == 6 && $stcStar.cost == "0")
         {
            _loc1_ = WealthUtil.parseCostStr($stcItemVo.quality == 6?$stcStar.cost_red:$stcStar.cost);
            _loc2_ = PlayerModel.ins.getCountByWealthVo(_loc1_);
            this.needRes.dataSource = _loc1_;
            this.needRes.txt_num.text = _loc2_ + "/" + _loc1_.count;
            this.needRes.txt_num.color = LabelUtils.getCountNeedColor(_loc2_,_loc1_.count);
            this.box_need.visible = true;
            this.box_redNeed.visible = false;
            if(selectEff)
            {
               selectEff.dispose();
               selectEff = null;
            }
         }
         else
         {
            this.box_need.visible = false;
            this.box_redNeed.visible = true;
            _loc1_ = getWealthVo(0);
            _loc2_ = PlayerModel.ins.getCountByWealthVo(_loc1_);
            this.needRes1.dataSource = _loc1_;
            this.needRes1.txt_num.text = _loc2_ + "/" + _loc1_.count;
            this.needRes1.txt_num.color = LabelUtils.getCountNeedColor(_loc2_,_loc1_.count);
            _loc1_ = getWealthVo(1);
            _loc2_ = PlayerModel.ins.getCountByWealthVo(_loc1_);
            this.needRes2.dataSource = _loc1_;
            this.needRes2.txt_num.text = _loc2_ + "/" + _loc1_.count;
            this.needRes2.txt_num.color = LabelUtils.getCountNeedColor(_loc2_,_loc1_.count);
            _loc1_ = getWealthVo(0,true);
            _loc2_ = PlayerModel.ins.getCountByWealthVo(_loc1_);
            this.needRes3.dataSource = _loc1_;
            this.needRes3.txt_num.text = _loc2_ + "/" + _loc1_.count;
            this.needRes3.txt_num.color = LabelUtils.getCountNeedColor(_loc2_,_loc1_.count);
            if(this.box_redNeed.selectedIndex < 0)
            {
               this.box_redNeed.selectedIndex = 0;
            }
         }
      }
      
      private function getWealthVo(param1:int, param2:Boolean = false) : WealthVo
      {
         var _loc3_:* = null;
         if(param2)
         {
            return WealthUtil.parseCostStr($stcStar.cost_red);
         }
         if($stcStar.cost == "0")
         {
            return WealthUtil.parseCostStr($stcStar.cost_red);
         }
         _loc3_ = $stcStar.cost.split("|");
         return WealthUtil.parseCostStr(_loc3_[param1]);
      }
      
      private function getCurSelWealthVo() : WealthVo
      {
         if($stcItemVo.quality == 6)
         {
            if(box_redNeed.selectedIndex == 2)
            {
               return getWealthVo(0,true);
            }
            return getWealthVo(box_redNeed.selectedIndex);
         }
         return getWealthVo(0);
      }
      
      public function refreshPanel() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         $stcItemVo = StcMgr.ins.getItemVo(model.item.itemId);
         $stcStar = StcMgr.ins.getVoByMultiColumnValue("static_equip_add_star",["equipId","star"],[model.item.itemId,model.item.star]);
         $lastStcStar = StcMgr.ins.getVoByMultiColumnValue("static_equip_add_star",["equipId","star"],[model.item.itemId,model.item.star - 1]);
         if($stcStar)
         {
            this.box_notavail.visible = false;
            this.box_avail.visible = true;
            refreshNeedRender();
            nowData = NpcPropVo.parseStarArrStr($stcStar,model.item.starExp,"+");
            list_prop.repeatY = nowData.length;
            list_prop.dataSource = nowData;
            if($stcStar.totalstep == 0)
            {
               this.box_need.visible = false;
               this.box_redNeed.visible = false;
               if(selectEff)
               {
                  selectEff.dispose();
                  selectEff = null;
               }
               this.box_nextTitle.visible = false;
               this.list_propNext.visible = false;
               this.box_nextExTitle.visible = false;
               this.box_progress.visible = false;
               this.btn_multi.disabled = true;
               this.btn_once.disabled = true;
               this.label_hint2.visible = true;
               this.label_hint3.visible = false;
            }
            else
            {
               if($stcItemVo.quality != 6 || $stcItemVo.quality == 6 && $stcStar.cost == "0")
               {
                  this.box_need.visible = true;
               }
               else
               {
                  this.box_redNeed.visible = true;
               }
               this.box_nextTitle.visible = true;
               this.list_propNext.visible = true;
               this.box_nextExTitle.visible = true;
               this.box_progress.visible = true;
               if(StcMgr.ins.getEquipStrengthVo(model.item.strengthId).level < 100)
               {
                  this.btn_multi.disabled = true;
                  this.btn_once.disabled = true;
                  this.box_progress.visible = false;
                  this.label_hint3.visible = true;
               }
               else
               {
                  this.btn_multi.disabled = false;
                  this.btn_once.disabled = false;
                  this.box_progress.visible = true;
                  this.label_hint3.visible = false;
               }
               this.label_hint2.visible = false;
               _loc1_ = StcMgr.ins.getVoByMultiColumnValue("static_equip_add_star",["equipId","star"],[model.item.itemId,model.item.star + 1]);
               nextData = NpcPropVo.parseStarArrStr($stcStar,$stcStar.totalstep,"+");
               nextData = nextData.concat(NpcPropVo.parseArrStr(_loc1_.extra_property,"+"));
               list_propNext.dataSource = nextData;
            }
            this.progress.value = model.item.starExp / $stcStar.totalstep;
            this.txt_progress.text = model.item.starExp + "/" + $stcStar.totalstep;
            if($stcItemVo.quality == 5)
            {
               this.list_stars.x = 197;
            }
            else if($stcItemVo.quality == 6)
            {
               this.list_stars.x = 131;
            }
            _loc2_ = EquipGrowModel.getStarLightArray(model.item.star,$stcItemVo.quality,"StarFromLeftToRight",false);
            this.list_stars.repeatX = _loc2_.length;
            this.list_stars.dataSource = _loc2_;
            if(black_bg)
            {
               black_bg.visible = false;
            }
         }
         else
         {
            this.box_notavail.visible = true;
            this.box_avail.visible = false;
            if(!black_bg)
            {
               black_bg = new Sprite();
               black_bg.graphics.beginFill(0);
               black_bg.graphics.drawRect(-1,0,this.width - 5,this.height - 2);
               DisplayUtils.addChildBelow(black_bg,this.box_notavail);
               black_bg.alpha = 0.5;
            }
            else
            {
               black_bg.visible = true;
            }
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.fadeIn();
         if(NGUtil.checkModuleShow(30500,this) == false)
         {
            if(NGUtil.isCurFuncId(30500) == false && FloatBubbleUtil.needShow(1150))
            {
               if(_taskAlertRender == null)
               {
                  _taskAlertRender = new TaskAlertRenderS2();
                  _taskAlertRender.x = 366;
                  _taskAlertRender.y = 4;
                  _taskAlertRender.show(1150);
               }
               FloatBubbleUtil.addOneTime(1150.toString());
               this.label_perc.addChild(_taskAlertRender);
            }
            else if(_taskAlertRender)
            {
               _taskAlertRender.dispose();
               _taskAlertRender = null;
            }
         }
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         if(_taskAlertRender)
         {
            _taskAlertRender.dispose();
            _taskAlertRender = null;
         }
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_item_num_change"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_item_num_change" === _loc3_)
         {
            refreshNeedRender();
         }
      }
      
      public function show() : void
      {
         if(model.item)
         {
            this.box_redNeed.selectedIndex = -1;
            model.RedPieceHint = false;
            this.btn_once.clickHandler = upStarHint;
            this.btn_multi.clickHandler = upStarMultiHint;
            refreshPanel();
         }
         ObserverMgr.ins.regObserver(this);
      }
      
      public function set weaoponRef(param1:Object) : void
      {
         weapon = param1 as UIWeapon3D;
      }
      
      public function get liansuoTxt() : ClipList
      {
         return this.lianSuoLvl;
      }
      
      public function updateLiansuoLvl() : void
      {
      }
   }
}
