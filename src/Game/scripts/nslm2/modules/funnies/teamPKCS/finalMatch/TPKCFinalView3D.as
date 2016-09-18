package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import flash.display.Sprite;
   import org.specter3d.display.Specter3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import game.ui.teamPKCS.finalMatch.TPKCFinalViewUI;
   import morn.core.components.View;
   import nslm2.utils.TransformUtil;
   import away3d.entities.Entity;
   import flash.geom.Point;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.geom.Vector3D;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import proto.CTeamInfo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.CteamArenaFinalStage;
   import nslm2.utils.Uint64Util;
   import proto.PlayerBaseInfo;
   import game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import flash.display.BitmapData;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.UIMgr;
   
   public class TPKCFinalView3D extends Sprite
   {
       
      
      public var layer3D:Specter3D;
      
      public var bg3d:Image3D;
      
      public var left:Vector.<nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalUnit3D>;
      
      public var right:Vector.<nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalUnit3D>;
      
      private var ui_finalView:TPKCFinalViewUI;
      
      private var _parent2D:View;
      
      private var box3d:nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalUnit3D;
      
      private var _leftInfo:CTeamInfo;
      
      private var _rightInfo:CTeamInfo;
      
      private var _nodeVo:CteamArenaFinalStage;
      
      private var line3d:Image3D;
      
      private var _isDispose:Boolean = false;
      
      public function TPKCFinalView3D(param1:View)
      {
         layer3D = new Specter3D();
         super();
         _parent2D = param1;
         UIMgr.root3D.addChild(layer3D);
      }
      
      public function init() : void
      {
         TransformUtil.cameraToSceneBattle();
         bg3d = new Image3D("img/tpkc_final_bg.jpg",1500,900,2000);
         bg3d.renderLayer = Entity.MAP_TILE_LAYER;
         layer3D.addChild(bg3d);
      }
      
      private function initAvatar() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         left.length = 0;
         right.length = 0;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = new nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalUnit3D();
            layer3D.addChild(_loc1_);
            left.push(_loc1_);
            _loc1_.pos2d = new Point(ui_finalView["left" + _loc2_].x + TPKConst.final_pos_base.x,-ui_finalView["left" + _loc2_].y + TPKConst.final_pos_base.y);
            _loc1_.z = -_loc1_.y;
            _loc1_ = new nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalUnit3D();
            right.push(_loc1_);
            layer3D.addChild(_loc1_);
            _loc1_.pos2d = new Point(ui_finalView["right" + _loc2_].x + TPKConst.final_pos_base.x,-ui_finalView["right" + _loc2_].y + TPKConst.final_pos_base.y);
            _loc1_.z = -_loc1_.y;
            _loc2_++;
         }
         initBox();
         updateTitlePos();
      }
      
      private function initBox() : void
      {
         box3d = new nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalUnit3D();
         layer3D.addChild(box3d);
         box3d.initByModelId(30002);
         box3d.rotationY = 0;
         box3d.rotationX = -10;
         box3d.pos2d = new Point(ui_finalView["d_center"].x + TPKConst.final_pos_base.x + 30,-ui_finalView["d_center"].y + TPKConst.final_pos_base.y - 10);
         box3d.buttonMode = true;
         box3d.addEventListener("unitMouseClick",unit_clickHandler);
         box3d.showName(LocaleMgr.ins.getStr(50800093));
         box3d.tag3DVBox.fixedY = -20;
      }
      
      private function unit_clickHandler(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("OPT_TPKC_OPEN_RANK_REWARD");
      }
      
      public function updateTitlePos() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(ui_finalView == null)
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < 5)
         {
            _loc1_ = left[_loc4_];
            _loc2_ = TransformUtil.stage3Dto2D(_loc1_.scenePosition,this);
            ui_finalView["tl" + _loc4_].x = _loc2_.x - 74;
            ui_finalView["tl" + _loc4_].y = _loc2_.y - 250;
            _loc1_ = right[_loc4_];
            _loc2_ = TransformUtil.stage3Dto2D(_loc1_.scenePosition,this);
            ui_finalView["tr" + _loc4_].x = _loc2_.x - 74;
            ui_finalView["tr" + _loc4_].y = _loc2_.y - 250;
            _loc4_++;
         }
         var _loc3_:Vector3D = TransformUtil.stage3Dto2D(box3d.scenePosition,this);
         this.ui_finalView.btn_0.x = _loc3_.x - this.ui_finalView.btn_0.width / 2;
         this.ui_finalView.btn_0.y = _loc3_.y + this.ui_finalView.btn_0.height + 5;
      }
      
      public function get model() : TPKCModel
      {
         return TPKCModel.ins;
      }
      
      private function gambleFunc() : void
      {
         var _loc1_:* = null;
         if(_leftInfo && _rightInfo)
         {
            _loc1_ = [];
            _loc1_.push(_leftInfo.id,_rightInfo.id);
            _loc1_.push(_nodeVo);
            _loc1_.push(31);
            ModuleMgr.ins.showModule(42011,_loc1_);
         }
      }
      
      private function myBetFunc() : void
      {
         ModuleMgr.ins.showModule(42012);
      }
      
      public function showFinalView(param1:CTeamInfo, param2:CTeamInfo) : void
      {
         var _loc8_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc11_:int = 0;
         _loc11_ = 0;
         var _loc4_:* = null;
         var _loc9_:* = null;
         _loc11_ = 0;
         var _loc7_:* = null;
         var _loc3_:* = null;
         if(ui_finalView)
         {
            ui_finalView.dispose();
         }
         ui_finalView = new TPKCFinalViewUI();
         _parent2D.addChild(ui_finalView);
         TPKCFinalScene(_parent2D).swapChildren(TPKCFinalScene(_parent2D).box_bt,ui_finalView);
         ui_finalView.box_line.visible = false;
         ui_finalView.btn_myBet.label = LocaleMgr.ins.getStr(50800094);
         ui_finalView.txt_down1.text = LocaleMgr.ins.getStr(50800095);
         ui_finalView.txt_down0.text = LocaleMgr.ins.getStr(50800106);
         drawLine();
         left = new Vector.<nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalUnit3D>();
         right = new Vector.<nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalUnit3D>();
         initAvatar();
         if(model.isFinalDay)
         {
            _loc8_ = 4;
            _loc5_ = [];
            _loc6_ = [model.time_arr_32to16,model.time_arr_16to8,model.time_arr_8to4,model.time_arr_4to2,model.time_arr_2to1];
            _loc5_.push(LocaleMgr.ins.getStr(TPKConst.titARr[_loc8_]));
            _loc5_.push(_loc6_[_loc8_][0],_loc6_[_loc8_][1],_loc6_[_loc8_][2],_loc6_[_loc8_][2],_loc6_[_loc8_][3],_loc6_[_loc8_][3],_loc6_[_loc8_][4],_loc6_[_loc8_][4]);
            this.ui_finalView.txt_up0.text = LocaleMgr.ins.getStr(50800113,_loc5_);
            if(_loc8_ == 4)
            {
               this.ui_finalView.txt_up1.text = model.remindStr;
            }
         }
         else
         {
            this.ui_finalView.txt_up0.text = "";
            this.ui_finalView.txt_up1.text = "";
         }
         ui_finalView.btn_0.clickHandler = gambleFunc;
         ui_finalView.btn_myBet.clickHandler = myBetFunc;
         ui_finalView.txt_l0.text = "-";
         ui_finalView.left_pow.text = "0";
         ui_finalView.txt_r0.text = "-";
         ui_finalView.right_pow.text = "0";
         ui_finalView.left_win.visible = false;
         ui_finalView.right_win.visible = false;
         ui_finalView.btn_0.disabled = true;
         _loc11_ = 0;
         while(_loc11_ < 5)
         {
            ui_finalView["tl" + _loc11_].visible = false;
            ui_finalView["tr" + _loc11_].visible = false;
            _loc11_++;
         }
         _leftInfo = param1;
         _rightInfo = param2;
         _nodeVo = null;
         if(param1 || param2)
         {
            var _loc13_:int = 0;
            var _loc12_:* = model.finalRes.index;
            for each(var _loc10_ in model.finalRes.index)
            {
               if(_loc10_.id == 31)
               {
                  _nodeVo = _loc10_;
                  break;
               }
            }
            ui_finalView.btn_0.disabled = false;
            ui_finalView.box_up.visible = true;
            _loc11_ = 0;
            while(_loc11_ < 5)
            {
               ui_finalView["tl" + _loc11_].visible = true;
               ui_finalView["tr" + _loc11_].visible = true;
               _loc11_++;
            }
            ui_finalView.txt_l0.text = TPKConst.getDistName(param1.op,param1.dist,param1.name);
            ui_finalView.txt_r0.text = TPKConst.getDistName(param2.op,param2.dist,param2.name);
            ui_finalView.left_pow.text = Uint64Util.toNumber(param1.ability) + "";
            ui_finalView.right_pow.text = Uint64Util.toNumber(param2.ability) + "";
            _loc4_ = TPKConst.setOrder(param1.member,param1.sort);
            _loc9_ = TPKConst.setOrder(param2.member,param2.sort);
            ui_finalView.left_win.visible = _nodeVo && Uint64Util.equal(_nodeVo.win,param1.id);
            ui_finalView.right_win.visible = _nodeVo && Uint64Util.equal(_nodeVo.win,param2.id);
            _loc11_ = 0;
            while(_loc11_ < 5)
            {
               _loc7_ = _loc4_[_loc11_].info;
               left[_loc11_].changeView(_loc7_);
               _loc3_ = ui_finalView["tl" + _loc11_];
               _loc3_.txt_info.text = TextFieldUtil.htmlText2(_loc7_.name,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(_loc7_.militaryRank)));
               _loc3_.txt_info.text = _loc3_.txt_info.text + ("\n" + LocaleMgr.ins.getStr(50500030,[_loc7_.ability]));
               _loc3_.txt_index.text = _loc11_ + 1 + "";
               _loc3_.img_dot.visible = true;
               _loc3_.txt_index.visible = true;
               _loc7_ = _loc9_[_loc11_].info;
               _loc3_ = ui_finalView["tr" + _loc11_];
               right[_loc11_].changeView(_loc7_);
               _loc3_.txt_info.text = TextFieldUtil.htmlText2(_loc7_.name,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(_loc7_.militaryRank)));
               _loc3_.txt_info.text = _loc3_.txt_info.text + ("\n" + LocaleMgr.ins.getStr(50500030,[_loc7_.ability]));
               _loc3_.txt_index.text = _loc11_ + 1 + "";
               _loc3_.img_dot.visible = true;
               _loc3_.txt_index.visible = true;
               _loc11_++;
            }
         }
      }
      
      public function disposefinalView() : void
      {
         var _loc1_:* = null;
         if(ui_finalView)
         {
            ui_finalView.dispose();
            ui_finalView = null;
         }
         if(line3d)
         {
            line3d.dispose();
            line3d = null;
         }
         if(box3d)
         {
            box3d.removeEventListener("unitMouseClick",unit_clickHandler);
            box3d.dispose();
            box3d = null;
         }
         var _loc3_:int = 0;
         var _loc2_:* = left;
         for each(_loc1_ in left)
         {
            _loc1_.dispose();
         }
         var _loc5_:int = 0;
         var _loc4_:* = right;
         for each(_loc1_ in right)
         {
            _loc1_.dispose();
         }
      }
      
      private function drawLine() : void
      {
         if(!line3d)
         {
            line3d = new Image3D(null,ui_finalView.box_line.width,ui_finalView.box_line.height);
            layer3D.addChild(line3d);
            line3d.z = 1000;
            line3d.y = -200;
         }
         var _loc1_:BitmapData = new BitmapData(ui_finalView.box_line.width,ui_finalView.box_line.height,true,16777215);
         _loc1_.draw(ui_finalView.box_line);
         line3d.showByBmd(_loc1_);
      }
      
      public function dispose() : void
      {
         _isDispose = true;
         if(bg3d)
         {
            bg3d.dispose();
            bg3d = null;
         }
         DisplayUtils.removeSelf(this);
         disposefinalView();
      }
   }
}
