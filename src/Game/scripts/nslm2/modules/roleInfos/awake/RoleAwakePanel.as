package nslm2.modules.roleInfos.awake
{
   import game.ui.roleInfos.awake.RoleAwakePanelUI;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.utils.DictHash;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.customs.components.PlayerTitleRender;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.components.Image;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.tooltipsModules.ToolTipGridActiveVo;
   import nslm2.modules.roleInfos.awake.render.RoleAwakePropRender;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.core.utils.ObjectUtils;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.consts.NPCPropConsts;
   import proto.ShenGridNodeInfo;
   import proto.ShenGridDingNodeInfo;
   import nslm2.mgrs.stcMgrs.vos.StcGridPageVo;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import morn.core.components.List;
   import morn.core.components.Box;
   import nslm2.modules.roleInfos.phaseUps.RolePropPhaseUpRenderS3;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.awake.render.RoleAwakeNeedRender;
   import morn.core.components.View;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import com.mz.core.utils.ArrayUtil;
   
   public class RoleAwakePanel extends RoleAwakePanelUI implements IRoleSubPanel, IViewStackPage, IObserver
   {
       
      
      private var model:RoleInfoModel;
      
      private var StarLineMap:DictHash;
      
      private var StarAngleMap:DictHash;
      
      private var HexagramLineMap:DictHash;
      
      private var HexagramAngleMap:DictHash;
      
      private var firstRunFlag:Boolean;
      
      private const StarNodeXY:Array = [148,0,0,110,98,90,197,90,296,110,72,173,223,173,148,224,59,275,243,275];
      
      private const HexagramNodeXY:Array = [150,0,0,80,98,80,203,80,296,80,57,153,241,153,0,226,99,225,203,225,296,225,150,303];
      
      private const StarLineXY:Array = [243,20,39,185,444,185,112,395,378,395];
      
      private const HexagramLineXY:Array = [243,10,48,104,433,103,49,332,429,332,243,422];
      
      public const SHAPE_STAR:int = 5;
      
      public const SHAPE_HEXAGRAM:int = 6;
      
      public var maxPage:int = 0;
      
      public const PAGE_1_FIRST_POINT:int = 501;
      
      public const PAGE_2_FIRST_POINT:int = 601;
      
      private var _currShape:int = 5;
      
      private var _currPage:uint = 1;
      
      private const CAN_EQUIP:int = 11;
      
      private const LEVEL_NOT_AVAIL:int = 12;
      
      private const COUNT_NOT_AVAIL:int = 13;
      
      private const HAVE_EQUIPPED:int = 14;
      
      private var _midAttrEff:BmcSpriteSheet;
      
      private var firstTime:Boolean = true;
      
      private var tweenArr:Array;
      
      private var toolTipArr:Array;
      
      private var _effComplete:BmcSpriteSheet;
      
      private var _midSurfaceEff:BmcSpriteSheet;
      
      public function RoleAwakePanel()
      {
         var _loc1_:int = 0;
         tweenArr = [];
         toolTipArr = [];
         super();
         this.label_link.buttonMode = true;
         this.label_link.mouseChildren = false;
         this.label_link.addEventListener("click",toAwakeRoad);
         RoleAwakeUtil.init();
         this.playerTitleRender.isShowTitleName = true;
         this.playerTitleRender.showLevel(false);
         StarLineMap = new DictHash();
         StarAngleMap = new DictHash();
         HexagramLineMap = new DictHash();
         HexagramAngleMap = new DictHash();
         StarLineMap.put(1,[3,1,4]);
         StarLineMap.put(2,[6,2,3]);
         StarLineMap.put(3,[4,5,7]);
         StarLineMap.put(4,[6,9,8]);
         StarLineMap.put(5,[8,10,7]);
         HexagramLineMap.put(1,[3,1,4]);
         HexagramLineMap.put(2,[6,2,3]);
         HexagramLineMap.put(3,[4,5,7]);
         HexagramLineMap.put(4,[6,8,9]);
         HexagramLineMap.put(5,[10,11,7]);
         HexagramLineMap.put(6,[9,12,10]);
         StarAngleMap.put(this["prop_render1"],[1]);
         StarAngleMap.put(this["prop_render2"],[2]);
         StarAngleMap.put(this["prop_render3"],[3]);
         StarAngleMap.put(this["prop_render4"],[4]);
         StarAngleMap.put(this["prop_render5"],[5]);
         HexagramAngleMap.put(this["prop_render1"],[1]);
         HexagramAngleMap.put(this["prop_render2"],[2]);
         HexagramAngleMap.put(this["prop_render3"],[3]);
         HexagramAngleMap.put(this["prop_render4"],[4]);
         HexagramAngleMap.put(this["prop_render5"],[5]);
         HexagramAngleMap.put(this["prop_render6"],[6]);
         this.btn_next.clickHandler = pageDown;
         this.btn_prev.clickHandler = pageUp;
         this.box_buff.mouseChildren = false;
         this.box_buff.addEventListener("mouseOver",showMidToolTip);
         this.box_buff.addEventListener("mouseOut",hideMidToolTip);
         _loc1_ = 0;
         while(_loc1_ < 6)
         {
            (this["prop_render" + (_loc1_ + 1)] as RoleAwakePropRender).mouseChildren = false;
            (this["prop_render" + (_loc1_ + 1)] as RoleAwakePropRender).addEventListener("mouseOver",showToolTip);
            (this["prop_render" + (_loc1_ + 1)] as RoleAwakePropRender).addEventListener("mouseOut",hideToolTip);
            _loc1_++;
         }
         mask_water.visible = false;
         img_mask.visible = false;
      }
      
      private function get playerTitleRender() : PlayerTitleRender
      {
         return this.playerTitleRenderUI as PlayerTitleRender;
      }
      
      protected function toAwakeRoad(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(30121,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      protected function hideToolTip(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide");
         var _loc4_:int = 0;
         var _loc3_:* = toolTipArr;
         for each(var _loc2_ in toolTipArr)
         {
            tweenArr.splice(tweenArr.indexOf(_loc2_),1);
            TweenLite.killTweensOf(_loc2_);
            _loc2_.alpha = 1;
            _loc2_.visible = false;
         }
         toolTipArr = [];
      }
      
      protected function showToolTip(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_show",new ToolTipGridActiveVo(param1.target.vo,!(param1.target as RoleAwakePropRender).grey));
         var _loc2_:int = 0;
         if(_currShape == 5)
         {
            var _loc4_:int = 0;
            var _loc3_:* = StarAngleMap.getValue(param1.target);
            for each(_loc2_ in StarAngleMap.getValue(param1.target))
            {
               shineLine(this["star_" + _loc2_],true);
            }
         }
         else
         {
            var _loc6_:int = 0;
            var _loc5_:* = HexagramAngleMap.getValue(param1.target);
            for each(_loc2_ in HexagramAngleMap.getValue(param1.target))
            {
               shineLine(this["hex_" + _loc2_],true);
            }
         }
      }
      
      protected function hideMidToolTip(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide");
      }
      
      protected function showMidToolTip(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide");
         ObserverMgr.ins.sendNotice("msg_tooltip_show",new ToolTipGridActiveVo(StcMgr.ins.getGridPageVo(100 * _currPage + 1),model.heroInfo.shengridinfo.pagenum > _currPage || model.heroInfo.shengridinfo.nodesinfo.length >= _currShape * 2,true));
      }
      
      private function pageUp() : void
      {
         _currPage = Number(_currPage) - 1;
         _currShape = setShape(_currPage);
         if(_currPage == 1)
         {
            this.btn_prev.disabled = true;
            this.btn_next.disabled = false;
         }
         else
         {
            this.btn_next.disabled = false;
            this.btn_prev.disabled = false;
         }
         ObjectUtils.gray(this.btn_next,false);
         this.btn_next.clickHandler = pageDown;
         refreshStars();
      }
      
      private function pageDown() : void
      {
         _currPage = Number(_currPage) + 1;
         _currShape = setShape(_currPage);
         if(_currPage == model.heroInfo.shengridinfo.pagenum)
         {
            this.btn_next.disabled = true;
            this.btn_prev.disabled = false;
         }
         else
         {
            this.btn_prev.disabled = false;
            this.btn_next.disabled = false;
            ObjectUtils.gray(this.btn_next,false);
            this.btn_next.clickHandler = pageDown;
         }
         refreshStars();
      }
      
      public function show(param1:Boolean = false) : void
      {
         if(StcMgr.ins.getGridPageVo(100 * (_currPage + 1) + 1) && StcMgr.ins.getGridPageVo(100 * (_currPage + 1) + 1).player_lv > model.heroInfo.baseInfo.level)
         {
            this.btn_next.disabled = false;
         }
         else
         {
            this.btn_next.disabled = true;
         }
         this.playerTitleRender.dataSource = model.heroInfo;
         refreshStars(!param1);
      }
      
      private function setFloatPos(param1:NpcPropVo, param2:int, param3:Array) : void
      {
         param1.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
      }
      
      public function viewStackIn() : void
      {
         var _loc2_:* = null;
         ObserverMgr.ins.regObserver(this);
         if(model.heroInfo.shengridinfo)
         {
            _currPage = model.heroInfo.shengridinfo.pagenum;
         }
         _currShape = setShape(_currPage);
         this.visible = true;
         this.show();
         this.fadeIn();
         var _loc1_:Array = StcMgr.ins.getGridPageTable().array.sortOn("sort");
         this.maxPage = _loc1_[_loc1_.length - 1].sort;
         this._currPage = model.heroInfo.shengridinfo.pagenum;
         _currShape = setShape(_currPage);
         refreshButton();
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         super.fadeView_fadeInCpl();
         NGUtil.checkModuleShow(30100,ModuleMgr.ins.getModule(30100),true);
      }
      
      private function refreshButton() : void
      {
         if(_currPage == maxPage)
         {
            this.btn_prev.disabled = false;
            if(model.heroInfo.shengridinfo.pagenum == maxPage)
            {
               this.btn_next.disabled = true;
            }
            else
            {
               this.btn_next.disabled = false;
               ObjectUtils.gray(this.btn_next);
               this.btn_next.addEventListener("mouseOver",showHint);
               this.btn_next.addEventListener("mouseOut",hideMidToolTip);
               this.btn_next.clickHandler = null;
            }
         }
         else if(_currPage == 1)
         {
            this.btn_prev.disabled = true;
            this.btn_next.disabled = false;
            ObjectUtils.gray(this.btn_next,false);
            this.btn_next.clickHandler = pageDown;
         }
         else
         {
            this.btn_prev.disabled = false;
            this.btn_next.disabled = false;
            ObjectUtils.gray(this.btn_next,false);
            this.btn_next.clickHandler = pageDown;
         }
      }
      
      private function setShape(param1:uint) : int
      {
         var _loc2_:Array = StcMgr.ins.getVoArrByColumnValue("static_grid_page","sort",param1);
         return _loc2_.length;
      }
      
      private function showProp(param1:Boolean = true) : void
      {
         var _loc11_:* = null;
         var _loc16_:* = null;
         var _loc10_:int = 0;
         var _loc5_:* = null;
         var _loc14_:* = null;
         var _loc8_:int = 0;
         var _loc6_:Array = [11,12,16,21,22];
         var _loc7_:Array = NpcPropVo.createPropArrZero(NPCPropConsts.ins.baseProp5List.concat(NPCPropConsts.ins.fightPropList).concat(_loc6_),"+");
         var _loc18_:int = 0;
         var _loc17_:* = model.heroInfo.shengridinfo.nodesinfo;
         for each(var _loc12_ in model.heroInfo.shengridinfo.nodesinfo)
         {
            _loc16_ = NpcPropVo.parseArrStr(StcMgr.ins.getGridNodeVo(_loc12_.id).node_attr,"+");
            NpcPropVo.addProp(_loc7_,_loc16_,"+");
         }
         var _loc20_:int = 0;
         var _loc19_:* = model.heroInfo.shengridinfo.dingnodes;
         for each(var _loc9_ in model.heroInfo.shengridinfo.dingnodes)
         {
            if(_loc9_.achieve)
            {
               _loc11_ = NpcPropVo.parseStr(StcMgr.ins.getGridPageVo(_loc9_.id).angle_attr,"+");
               NpcPropVo.addProp(_loc7_,[_loc11_],"+");
            }
         }
         var _loc13_:uint = model.heroInfo.shengridinfo.pagenum - 1;
         while(_loc13_ > 0)
         {
            _loc10_ = 0;
            _loc8_ = setShape(_loc13_);
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc5_ = StcMgr.ins.getGridPageVo(100 * _loc13_ + _loc10_ + 1);
               if(_loc10_ == 0)
               {
                  _loc16_ = NpcPropVo.parseArrStr(_loc5_.mid_attr,"+");
                  NpcPropVo.addProp(_loc7_,_loc16_,"+");
               }
               _loc11_ = NpcPropVo.parseStr(_loc5_.angle_attr,"+");
               NpcPropVo.addProp(_loc7_,[_loc11_],"+");
               _loc10_++;
            }
            _loc10_ = 0;
            while(_loc10_ < _loc8_ * 2)
            {
               _loc14_ = StcMgr.ins.getGridNodeVo(1000 * _loc13_ + (_loc10_ + 1) * 10);
               _loc16_ = NpcPropVo.parseArrStr(_loc14_.node_attr,"+");
               NpcPropVo.addProp(_loc7_,_loc16_,"+");
               _loc10_++;
            }
            _loc13_--;
         }
         var _loc3_:Array = StcMgr.ins.getGridPageTable().array.sortOn("sort");
         this.maxPage = _loc3_[_loc3_.length - 1].sort;
         if(model.heroInfo.shengridinfo.nodesinfo.length == 12 && model.heroInfo.shengridinfo.pagenum == maxPage)
         {
            _loc5_ = StcMgr.ins.getGridPageVo(100 * maxPage + 1);
            _loc16_ = NpcPropVo.parseArrStr(_loc5_.mid_attr,"+");
            NpcPropVo.addProp(_loc7_,_loc16_,"+");
         }
         if(!param1)
         {
            _loc7_.forEach(setFloatPos);
         }
         var _loc15_:Array = [];
         var _loc4_:Array = [];
         var _loc2_:int = 0;
         _loc10_ = 0;
         while(_loc10_ < _loc7_.length)
         {
            _loc11_ = _loc7_[_loc10_] as NpcPropVo;
            if(_loc10_ < 10)
            {
               _loc15_.push(_loc11_);
               if(_loc11_.value != 0)
               {
                  _loc2_++;
               }
            }
            else
            {
               _loc4_.push(_loc11_);
            }
            _loc10_++;
         }
         _loc2_ = Math.ceil(_loc2_ / 2);
         if(_loc2_ > 0)
         {
            this.imgAbilityCLine.visible = true;
            this.imgAbilityCLine.y = this.list_prop.y + _loc2_ * 28 + 3;
         }
         else
         {
            this.imgAbilityCLine.visible = false;
         }
         this.list_prop2.y = this.list_prop.y + _loc2_ * 28 + 15;
         this.list_prop.dataSource = _loc15_;
         this.list_prop2.dataSource = _loc4_;
         updateListPosition(list_prop);
         updateListPosition(list_prop2);
      }
      
      private function updateListPosition(param1:List) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         param1.commitMeasure();
         var _loc2_:Vector.<Box> = param1.cells;
         var _loc3_:int = 0;
         var _loc4_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc6_] as RolePropPhaseUpRenderS3;
            if(_loc5_.isShow)
            {
               _loc5_.x = int(_loc3_ % 2) * (_loc5_.width + param1.spaceX);
               _loc5_.y = int(_loc3_ / 2) * (_loc5_.height + param1.spaceY);
               _loc3_++;
            }
            _loc6_++;
         }
      }
      
      private function refreshStars(param1:Boolean = true) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         tweenArr = [];
         showProp(param1);
         var _loc5_:int = 0;
         if(_currShape == 5)
         {
            _loc5_ = 0;
            while(_loc5_ < 6)
            {
               _loc2_ = StcMgr.ins.getGridPageVo(100 * _currPage + _loc5_ + 1);
               (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).x = StarLineXY[2 * _loc5_];
               (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).y = StarLineXY[2 * _loc5_ + 1];
               if(_loc2_)
               {
                  if(_loc5_ == 0)
                  {
                     this.label_midAttr.text = LocaleMgr.ins.getStr(_loc2_.mid_attr_desc);
                  }
                  (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).dataSource = _loc2_;
                  if(model.heroInfo.shengridinfo.pagenum > _currPage)
                  {
                     (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).grey = false;
                  }
                  else
                  {
                     (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).grey = true;
                  }
               }
               _loc5_++;
            }
            _loc5_ = 0;
            while(_loc5_ < _currShape * 2)
            {
               _loc3_ = StcMgr.ins.getGridNodeVo(1000 * _currPage + (_loc5_ + 1) * 10);
               (this["render_item" + (_loc5_ + 1)] as RoleAwakeNeedRender).dataSource = _loc3_;
               this["render_item" + (_loc5_ + 1)].x = StarNodeXY[2 * _loc5_];
               this["render_item" + (_loc5_ + 1)].y = StarNodeXY[2 * _loc5_ + 1];
               _loc5_++;
            }
            this.box_buff.x = 214;
            this.box_buff.y = 199;
            this.box_buff.scale = 0.8;
            this.label_buffdesc.x = 229;
            this.label_buffdesc.y = 253;
            this.label_buffdesc.size = 12;
            this.box_nodes.y = 76;
            this.render_item11.visible = false;
            this.render_item12.visible = false;
            this.prop_render6.visible = false;
            this.img_star.visible = true;
            this.img_hexagram.visible = false;
            this.star_lines.visible = true;
            this.hexagram_lines.visible = false;
            ObserverMgr.ins.sendNotice("msg_role_awake_change_bg","png.uiRoleInfo.awake.img_hexagramBG");
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < 6)
            {
               _loc2_ = StcMgr.ins.getGridPageVo(100 * _currPage + _loc5_ + 1);
               (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).x = HexagramLineXY[2 * _loc5_];
               (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).y = HexagramLineXY[2 * _loc5_ + 1];
               if(_loc2_)
               {
                  if(_loc5_ == 0)
                  {
                     this.label_midAttr.text = LocaleMgr.ins.getStr(_loc2_.mid_attr_desc);
                  }
                  (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).dataSource = _loc2_;
                  if(model.heroInfo.shengridinfo.pagenum <= _currPage)
                  {
                     (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).grey = true;
                  }
                  else
                  {
                     (this["prop_render" + (_loc5_ + 1)] as RoleAwakePropRender).grey = false;
                  }
               }
               _loc5_++;
            }
            _loc5_ = 0;
            while(_loc5_ < _currShape * 2)
            {
               _loc3_ = StcMgr.ins.getGridNodeVo(1000 * _currPage + (_loc5_ + 1) * 10);
               (this["render_item" + (_loc5_ + 1)] as RoleAwakeNeedRender).dataSource = _loc3_;
               this["render_item" + (_loc5_ + 1)].x = HexagramNodeXY[2 * _loc5_];
               this["render_item" + (_loc5_ + 1)].y = HexagramNodeXY[2 * _loc5_ + 1];
               _loc5_++;
            }
            this.box_buff.x = 203;
            this.box_buff.y = 175;
            this.box_buff.scale = 1;
            this.label_buffdesc.x = 233;
            this.label_buffdesc.y = 243;
            this.label_buffdesc.size = 14;
            this.box_nodes.y = 66;
            this.render_item11.visible = true;
            this.render_item12.visible = true;
            this.prop_render6.visible = true;
            this.img_star.visible = false;
            this.img_hexagram.visible = true;
            this.star_lines.visible = false;
            this.hexagram_lines.visible = true;
            ObserverMgr.ins.sendNotice("msg_role_awake_change_bg","png.uiRoleInfo.awake.img_hexagramBG");
         }
         if(param1)
         {
            _loc5_ = 0;
            while(_loc5_ < 6)
            {
               TweenLite.from(this["prop_render" + (_loc5_ + 1)],1,{"alpha":0});
               _loc5_++;
            }
            _loc5_ = 0;
            while(_loc5_ < _currShape * 2)
            {
               TweenLite.from(this["render_item" + (_loc5_ + 1)],0.5,{
                  "x":175,
                  "y":150,
                  "alpha":0
               });
               _loc5_++;
            }
         }
         this.label_current.text = LocaleMgr.ins.getStr(30200017,[_currPage]);
         checkLine();
         checkMidProp();
         checkAngles();
         refreshButton();
      }
      
      private function checkMidProp() : void
      {
         var _loc2_:* = null;
         this.label_buffdesc.text = "";
         var _loc1_:NpcPropVo = NpcPropVo.parseArrStr(StcMgr.ins.getGridPageVo(100 * _currPage + 1).mid_attr)[0];
         this.label_buffdesc.size = 19;
         this.label_buffdesc.text = "+" + (_loc1_.value < 1?int(_loc1_.value * 1000) / 10 + "%":_loc1_.value);
         if(model.heroInfo.shengridinfo.nodesinfo.length > 0 && model.heroInfo.shengridinfo.pagenum == _currPage)
         {
            if(!_midSurfaceEff)
            {
               _midSurfaceEff = new BmcSpriteSheet();
               _midSurfaceEff.init(9140,1,"all",true);
               box_buff.addChildAt(_midSurfaceEff,1);
            }
            else
            {
               _midSurfaceEff.visible = true;
               _midSurfaceEff.init(9140,1,"all",true);
            }
            _midSurfaceEff.mask = this.mask_water;
            _midSurfaceEff.x = 61;
            _midSurfaceEff.y = 16 + 100 * (_currShape * 2 - model.heroInfo.shengridinfo.nodesinfo.length) / _currShape / 2;
            if(!_midAttrEff)
            {
               _midAttrEff = new BmcSpriteSheet();
               _midAttrEff.init(9110,1,"all",true);
               _midAttrEff.x = 58;
               _midAttrEff.y = 58;
               box_buff.addChildAt(_midAttrEff,1);
            }
            else
            {
               _midAttrEff.visible = true;
               _midAttrEff.init(9110,1,"all",true);
            }
            _midAttrEff.mask = img_mask;
            img_mask.scaleY = -model.heroInfo.shengridinfo.nodesinfo.length / _currShape / 2;
            img_mask.y = 122;
         }
         else if(model.heroInfo.shengridinfo.pagenum > _currPage || model.heroInfo.shengridinfo.pagenum == maxPage && model.heroInfo.shengridinfo.nodesinfo.length == 6 * 2)
         {
            if(!_midAttrEff)
            {
               _midAttrEff = new BmcSpriteSheet();
               _midAttrEff.init(9110,1,"all",true);
               _midAttrEff.x = 58;
               _midAttrEff.y = 58;
               box_buff.addChildAt(_midAttrEff,2);
            }
            else
            {
               _midAttrEff.visible = true;
               _midAttrEff.init(9110,1,"all",true);
            }
            if(_midAttrEff.mask)
            {
               _midAttrEff.mask = null;
            }
            if(_midSurfaceEff)
            {
               _midSurfaceEff.dispose();
               _midSurfaceEff.visible = false;
               _midSurfaceEff = null;
            }
         }
         else
         {
            if(_midSurfaceEff)
            {
               _midSurfaceEff.dispose();
               _midSurfaceEff.visible = false;
               _midSurfaceEff = null;
            }
            if(_midAttrEff)
            {
               _midAttrEff.dispose();
               _midAttrEff.visible = false;
               _midAttrEff = null;
            }
         }
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      public function set modelRef(param1:RoleInfoModel) : void
      {
         model = param1;
      }
      
      public function get subBarRef() : View
      {
         return null;
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_role_awake_equip_cpl","msg_role_awake_refresh_panel"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_role_awake_equip_cpl" !== _loc3_)
         {
            if("msg_role_awake_refresh_panel" !== _loc3_)
            {
            }
            addr103:
            return;
         }
         if(!_effComplete)
         {
            _effComplete = new BmcSpriteSheet();
            _effComplete.init(9130);
            _effComplete.x = (this["render_item" + (param2 as StcGridNodeVo).id % 1000 / 10] as RoleAwakeNeedRender).x + 21;
            _effComplete.y = (this["render_item" + (param2 as StcGridNodeVo).id % 1000 / 10] as RoleAwakeNeedRender).y + 17;
            box_nodes.addChild(_effComplete);
         }
         else
         {
            _effComplete.x = (this["render_item" + (param2 as StcGridNodeVo).id % 1000 / 10] as RoleAwakeNeedRender).x + 21;
            _effComplete.y = (this["render_item" + (param2 as StcGridNodeVo).id % 1000 / 10] as RoleAwakeNeedRender).y + 17;
            _effComplete.init(9130);
         }
         refreshStars(false);
         §§goto(addr103);
      }
      
      protected function showHint(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_show",LocaleMgr.ins.getStr(30121033));
      }
      
      private function checkAngles() : void
      {
         if(model.heroInfo.shengridinfo.pagenum == _currPage)
         {
            var _loc3_:int = 0;
            var _loc2_:* = model.heroInfo.shengridinfo.dingnodes;
            for each(var _loc1_ in model.heroInfo.shengridinfo.dingnodes)
            {
               if(_currShape == 5)
               {
                  if(_loc1_.id % 100 < 6)
                  {
                     (this["prop_render" + _loc1_.id % 100] as RoleAwakePropRender).grey = !_loc1_.achieve;
                  }
                  else
                  {
                     (this["prop_render" + (_loc1_.id % 100 - 6)] as RoleAwakePropRender).grey = !_loc1_.achieve;
                  }
               }
               else if(_currShape == 6)
               {
                  if(_loc1_.id % 100 > 6)
                  {
                     (this["prop_render" + (_loc1_.id % 100 - 6)] as RoleAwakePropRender).grey = !_loc1_.achieve;
                  }
                  else
                  {
                     (this["prop_render" + _loc1_.id % 100] as RoleAwakePropRender).grey = !_loc1_.achieve;
                  }
               }
            }
         }
      }
      
      private function checkLine() : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = model.heroInfo.shengridinfo.nodesinfo;
         for each(var _loc4_ in model.heroInfo.shengridinfo.nodesinfo)
         {
            _loc1_.push(_loc4_.id % 1000 / 10);
         }
         if(_currShape == 5)
         {
            _loc3_ = 0;
            if(model.heroInfo.shengridinfo.pagenum == _currPage)
            {
               _loc3_ = 0;
               while(_loc3_ < StarLineMap.array.length)
               {
                  if(ArrayUtil.hasShare(_loc1_,StarLineMap.getValue(_loc3_ + 1)).length == 3)
                  {
                     shineLine(this["star_" + (_loc3_ + 1)]);
                  }
                  else
                  {
                     TweenLite.killTweensOf(this["star_" + (_loc2_ + 1)]);
                     this["star_" + (_loc3_ + 1)].alpha = 1;
                     this["star_" + (_loc3_ + 1)].visible = false;
                  }
                  _loc3_++;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < StarLineMap.array.length)
               {
                  if(model.heroInfo.shengridinfo.pagenum > _currPage)
                  {
                     shineLine(this["star_" + (_loc3_ + 1)]);
                  }
                  else
                  {
                     TweenLite.killTweensOf(this["star_" + (_loc2_ + 1)]);
                     this["star_" + (_loc3_ + 1)].alpha = 1;
                     this["star_" + (_loc3_ + 1)].visible = false;
                  }
                  _loc3_++;
               }
            }
         }
         else if(model.heroInfo.shengridinfo.pagenum == _currPage)
         {
            _loc2_ = 0;
            while(_loc2_ < HexagramLineMap.array.length)
            {
               if(ArrayUtil.hasShare(_loc1_,HexagramLineMap.getValue(_loc2_ + 1)).length == 3)
               {
                  shineLine(this["hex_" + (_loc2_ + 1)]);
               }
               else
               {
                  TweenLite.killTweensOf(this["hex_" + (_loc2_ + 1)]);
                  this["hex_" + (_loc3_ + 1)].alpha = 1;
                  this["hex_" + (_loc2_ + 1)].visible = false;
               }
               _loc2_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < HexagramLineMap.array.length)
            {
               if(model.heroInfo.shengridinfo.pagenum > _currPage)
               {
                  shineLine(this["hex_" + (_loc3_ + 1)]);
               }
               else
               {
                  TweenLite.killTweensOf(this["hex_" + (_loc2_ + 1)]);
                  this["hex_" + (_loc3_ + 1)].alpha = 1;
                  this["hex_" + (_loc3_ + 1)].visible = false;
               }
               _loc3_++;
            }
         }
      }
      
      private function shineLine(param1:Image, param2:Boolean = false) : void
      {
         if(tweenArr.indexOf(param1) == -1)
         {
            tweenArr.push(param1);
            if(param2)
            {
               toolTipArr.push(param1);
            }
            param1.visible = true;
            param1.alpha = 1;
            TweenLite.from(param1,1,{
               "alpha":0,
               "onComplete":tweenCpl1
            });
            return;
         }
      }
      
      private function tweenCpl1() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = tweenArr;
         for each(var _loc1_ in tweenArr)
         {
            TweenLite.to(_loc1_,1,{
               "alpha":0,
               "onComplete":tweenCpl2
            });
         }
      }
      
      private function tweenCpl2() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = tweenArr;
         for each(var _loc1_ in tweenArr)
         {
            TweenLite.to(_loc1_,1,{
               "alpha":1,
               "onComplete":tweenCpl1
            });
         }
      }
   }
}
