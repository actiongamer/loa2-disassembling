package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.RoleTupoNeedRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.roleInfos.vo.RoleTupoNeedVo;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import com.mz.core.utils.DisplayUtils;
   import flash.events.MouseEvent;
   import proto.HeroTuPoItemEquipReq;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import proto.ProtocolStatusRes;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.foundations.AlertUtil;
   import flash.geom.Point;
   
   public class RoleTupoNeedRender extends RoleTupoNeedRenderUI implements IObserver
   {
       
      
      private var _state:int;
      
      private var _eff:BmcSpriteSheet;
      
      private var _roleTupoNeedVo:RoleTupoNeedVo;
      
      private var _scaleMode:Boolean = false;
      
      private var _redPoint:RedPoint;
      
      public var breathCtrl:GlowFilterBreathCtrl;
      
      public function RoleTupoNeedRender()
      {
         _redPoint = new RedPoint();
         super();
      }
      
      public function get status() : int
      {
         return _state;
      }
      
      public function addBreath() : void
      {
         breathCtrl = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER_BLUE,2,0,0.3,2).addHandler(breath_cb);
         this.parts.push(breathCtrl);
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.filters = param1;
      }
      
      public function get vo() : WealthVo
      {
         return this.dataSource as WealthVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc4_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(this.scale < 1)
         {
            _scaleMode = true;
         }
         if(ClientConfig.isRuLang())
         {
            this.txt_get.size = 10;
         }
         if(_scaleMode)
         {
            this.txt_get.visible = false;
            this.img_plus.scale = 2;
            this.img_plus.centerX = 0;
            this.img_plus.centerY = 0;
         }
         _roleTupoNeedVo = param1 as RoleTupoNeedVo;
         .super.dataSource = !!_roleTupoNeedVo?_roleTupoNeedVo.wealthVo:param1;
         if(dataSource)
         {
            ObserverMgr.ins.regObserver(this);
            this.render_item.dataSource = vo;
            if(vo.stcItemVo && vo.stcItemVo.kind == 81)
            {
               this.addEventListener("click",onClick);
               this.render_item.txt_countAndNeed.visible = false;
               this.buttonMode = true;
               _loc6_ = StcMgr.ins.getTupoVo(_roleTupoNeedVo.panelBaseInfo.baseId);
               _state = RoleTupoUtil.getGodhoodEquipState(_roleTupoNeedVo.panelBaseInfo,vo.sid);
               if(!_scaleMode && _state != 1)
               {
                  _loc5_ = StcMgr.ins.getItemVo(vo.sid);
                  _loc7_ = RoleTupoUtil.getNeedGodhoodArr(_loc6_);
                  _loc4_ = _loc7_.length;
                  _loc8_ = 0;
                  while(_loc8_ < _loc4_)
                  {
                     if((_loc7_[_loc8_] as WealthVo).sid == vo.sid)
                     {
                        this.txt_status.visible = true;
                        _loc3_ = PlayerModel.ins.getCountByWealthVo(_loc7_[_loc8_]);
                        _loc2_ = _loc5_.extend_1;
                        this.txt_status.text = _loc3_ + "/" + _loc2_;
                        if(_loc3_ < _loc2_)
                        {
                           this.txt_status.style = "不足禁止红";
                        }
                        else
                        {
                           this.txt_status.style = "普通绿色";
                        }
                     }
                     _loc8_++;
                  }
               }
               else
               {
                  this.txt_status.visible = false;
               }
               changeView();
            }
            else if(vo.stcNpcVo)
            {
               this.addEventListener("click",onClick);
               this.render_item.txt_countAndNeed.visible = true;
               this.img_plus.visible = false;
               this.buttonMode = true;
               _state = 5;
            }
            else
            {
               this.removeEventListener("click",onClick);
               this.render_item.txt_countAndNeed.visible = true;
               this.buttonMode = false;
               this.img_plus.visible = false;
            }
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      private function changeView() : void
      {
         switch(int(_state) - 1)
         {
            case 0:
               this.render_item.img_icon.filters = null;
               this.img_plus.visible = false;
               this.txt_get.visible = false;
               break;
            case 1:
               if(!_scaleMode)
               {
                  this.render_item.img_icon.filters = [FilterUtil.grayFilter()];
               }
               else
               {
                  this.render_item.img_icon.filters = [FilterUtil.grayFilter(),FilterUtil.highLightFilter(-25)];
               }
               this.img_plus.visible = true;
               this.txt_get.visible = false;
               break;
            case 2:
               if(!_scaleMode)
               {
                  this.render_item.img_icon.filters = [FilterUtil.grayFilter()];
               }
               else
               {
                  this.render_item.img_icon.filters = [FilterUtil.grayFilter(),FilterUtil.highLightFilter(-25)];
               }
               this.img_plus.visible = false;
               this.txt_get.visible = false;
               break;
            case 3:
               this.render_item.img_icon.filters = [FilterUtil.grayFilter(),FilterUtil.highLightFilter(-25)];
               this.img_plus.visible = false;
               if(!_scaleMode)
               {
                  this.txt_get.visible = true;
               }
               else
               {
                  this.txt_get.visible = false;
               }
         }
         if(_scaleMode)
         {
            this.render_item.img_quality.filters = [FilterUtil.grayFilter()];
         }
         showOrHideEff();
      }
      
      private function showOrHideEff() : void
      {
         switch(int(_state) - 1)
         {
            case 0:
               if(_eff)
               {
                  _eff.dispose();
                  _eff = null;
               }
               DisplayUtils.removeSelf(_redPoint);
               break;
            case 1:
               if(_eff)
               {
                  _eff.dispose();
                  _eff = null;
               }
               if(_scaleMode)
               {
                  this.img_plus.skin = "png.uiHeroShow.img_yellowPlus";
                  break;
               }
               break;
            case 2:
            case 3:
               if(!_scaleMode)
               {
                  if(!_eff)
                  {
                     _eff = new BmcSpriteSheet();
                     _eff.x = -14;
                     _eff.y = -14;
                     _eff.init(1118,1,"all",true);
                     this.addChild(_eff);
                  }
                  else
                  {
                     _eff.gotoAndPlay(1);
                  }
               }
               else
               {
                  this.txt_get.visible = false;
                  this.img_plus.height = 14;
                  this.img_plus.width = 14;
                  this.img_plus.visible = true;
                  this.img_plus.skin = "png.uiHeroShow.img_greenPlus";
               }
               _redPoint.top = -2;
               _redPoint.right = -2;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         switch(int(_state) - 2)
         {
            case 0:
               if(RoleInfoModel.ins.heroInfo == null)
               {
                  return;
               }
               ModuleMgr.ins.showModule(30111,this.vo,ModuleMgr.ins.popLayer.curModuleId);
               break;
            case 1:
               _loc2_ = new HeroTuPoItemEquipReq();
               _loc2_.hero = RoleInfoModel.ins.heroInfo.baseInfo.id;
               _loc2_.item = BagModel.ins.getIdBySid(vo.sid);
               ServerEngine.ins.send(5015,_loc2_,server_onEquipCpl);
               break;
            case 2:
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(this.vo),ModuleMgr.ins.popLayer.curModuleId);
               break;
            case 3:
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(this.vo.stcNpcVo.get_point)),30100);
         }
      }
      
      private function server_onEquipCpl(param1:ProtocolStatusRes) : void
      {
         var _loc2_:Array = NpcPropVo.filterZeroProp(NpcPropVo.parseItemVo(vo.stcItemVo));
         AlertUtil.showPropArrChangeTip(_loc2_,null,null,DisplayUtils.globarCenter(this).add(new Point(0,-100)));
         ObserverMgr.ins.sendNotice("msg_role_godhood_equip_cpl",vo);
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_role_godhood_equip_cpl"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_role_godhood_equip_cpl" === _loc3_)
         {
            if(this.vo.sid == (param2 as WealthVo).sid)
            {
               playEff();
            }
         }
      }
      
      public function playEff() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = -34;
         _loc1_.y = -29;
         _loc1_.init(1060);
         this.addChild(_loc1_);
         _state = 1;
         changeView();
      }
      
      override public function dispose() : void
      {
         if(this._redPoint)
         {
            _redPoint.dispose();
            _redPoint = null;
         }
         ObserverMgr.ins.unregObserver(this);
         this.removeEventListener("click",onClick);
         super.dispose();
      }
   }
}
