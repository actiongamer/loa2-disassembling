package nslm2.modules.scenes.commons
{
   import com.mz.core.event.MzEvent;
   import com.mz.core.utils.MathUtil;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DWinActionCtrl;
   import flash.events.Event;
   import com.game.shared.component.NameTag3D;
   import morn.core.utils.StringUtils;
   import com.mz.core.configs.EnvConfig;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Image;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import away3d.entities.Entity;
   import away3d.containers.ObjectContainer3D;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class ScenePet3D extends ScenePlayer3D
   {
      
      private static const TEAM_MEMBER_GAP:int = 120;
       
      
      private var isRun:Boolean;
      
      private var followTarget:nslm2.modules.scenes.commons.Unit3DBase;
      
      private var runTargetPoint:Array;
      
      public var sayTag3D:NameTag3D;
      
      private var sayArr:Array;
      
      private var lasySayIndex:int = -1;
      
      public function ScenePet3D(param1:ObjectContainer3D, param2:nslm2.modules.scenes.commons.Unit3DBase)
      {
         runTargetPoint = [];
         super(param1);
         this.box3D2.scaleAll = DefindConsts.SCENE_AVATAR_SCALE_3D / DefindConsts.SCENE_AVATAR_SCALE_SCENE * 0.6;
         this.followTarget = param2;
         this.mouseEnabled = false;
         this.mouseChildren = false;
         followTarget.addEventListener("EVT_Unit3DBase_runStart",unit3d_runStart);
         followTarget.addEventListener("EVT_Unit3DBase_runCpl",unit3d_runCpl);
         this.overMethodEnabled = false;
         this.buttonMode = false;
         this.resetPos();
         TweenLite.delayedCall(MathUtil.random(10,3),doWin);
         TweenLite.delayedCall(3,checkPos);
      }
      
      private function unit3d_runStart(param1:MzEvent) : void
      {
         var _loc7_:Number = NaN;
         this.moveSpeed = this.followTarget.moveSpeed * 0.8;
         var _loc4_:Unit3DBaseRunData = param1.data as Unit3DBaseRunData;
         var _loc8_:Number = _loc4_.toX;
         var _loc9_:Number = _loc4_.toY;
         var _loc5_:Array = _loc4_.runPath;
         var _loc3_:Number = -MathUtil.roWith2Point(this.followTarget.pos2d,new Point(_loc8_,_loc9_)) * 3.14159265358979 / 180;
         var _loc6_:int = _loc8_ - 120 * Math.cos(_loc3_);
         var _loc2_:int = _loc9_ + 120 * Math.sin(_loc3_);
         if(_loc5_ && _loc5_.length > 1)
         {
            _loc7_ = MathUtil.random(0.8,0.4);
            TweenLite.delayedCall(0.2,notifyFollower,[[this.followTarget.pos2d,new Point(_loc6_,_loc2_)]]);
         }
      }
      
      override public function set showByLimite(param1:Boolean) : void
      {
         .super.showByLimite = param1;
      }
      
      private function checkPos() : void
      {
         var _loc1_:Number = NaN;
         if(this.action == this.actStd)
         {
            _loc1_ = MathUtil.disWith2Point(this.pos2d,this.followTarget.pos2d);
            if(_loc1_ > 120 + 10)
            {
               this.resetPos();
            }
         }
      }
      
      public function resetPos() : void
      {
         var _loc1_:Number = MathUtil.angelToRadian(followTarget.rotation);
         this.rotation = followTarget.rotation;
         this.pos2d = MathUtil.getNearByPoint3D(followTarget.pos2d,120,_loc1_);
      }
      
      private function doWin() : void
      {
         var _loc1_:Boolean = false;
         if(this.visible && this.avatar)
         {
            if(this.action == this.actStd)
            {
               _loc1_ = false;
               new Avatar3DWinActionCtrl(this,null,_loc1_);
            }
         }
         TweenLite.delayedCall(MathUtil.random(10,3),doWin);
      }
      
      private function notifyFollower(param1:Array) : void
      {
         this.follow(new MzEvent("",param1));
      }
      
      protected function follow(param1:MzEvent) : void
      {
         var _loc2_:Point = param1.data[1];
         run(_loc2_.x,_loc2_.y);
      }
      
      private function run(param1:int, param2:int) : void
      {
         isRun = true;
         this.runTo(param1,param2,runCpl);
      }
      
      override protected function countRunPath(param1:int, param2:int) : Array
      {
         return [new Point(param1,param2)];
      }
      
      private function unit3d_runCpl(param1:Event) : void
      {
         var _loc2_:* = null;
         if(runTargetPoint.length > 0)
         {
            _loc2_ = runTargetPoint.shift();
            run(_loc2_.x,_loc2_.y);
         }
         else
         {
            isRun = false;
            this.rotation = followTarget.rotation;
         }
      }
      
      public function initSay(param1:String) : void
      {
         if(StringUtils.isNull(param1))
         {
            return;
         }
         this.sayArr = param1.split(",");
         if(EnvConfig.ins.showDebugModule)
         {
            showSay();
         }
         else
         {
            hideSay();
         }
      }
      
      private function hideSay() : void
      {
         if(sayTag3D)
         {
            this.sayTag3D.visible = false;
         }
         TweenLite.delayedCall(MathUtil.random(8,16),this.showSay);
      }
      
      private function showSay() : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(!EnvConfig.ins.showDebugModule)
         {
            TweenLite.delayedCall(MathUtil.random(6,3),this.hideSay);
         }
         if(sayArr.length == 1)
         {
            lasySayIndex = 0;
            var _loc5_:Label = new Label();
            _loc5_.align = "center";
            _loc5_.width = 126;
            _loc5_.height = 80;
            _loc5_.style = "普通说明";
            _loc5_.color = 16046112;
            _loc5_.size = 11;
            _loc5_.leading = -1;
            _loc5_.text = LocaleMgr.ins.getStr(sayArr[lasySayIndex]);
            _loc5_.multiline = true;
            _loc5_.wordWrap = true;
            _loc5_.commitMeasure();
            var _loc4_:Image = new Image();
            _loc4_.sizeGrid = "10,10,50,10";
            _loc4_.skin = "png.a5.commonImgs.气泡_2";
            _loc4_.width = 130;
            _loc4_.commitMeasure();
            var _loc1_:BitmapData = _loc4_.bitmapData.clone();
            var _loc6_:Matrix = new Matrix();
            _loc6_.tx = 2;
            if(_loc5_.textHeight > 45)
            {
               _loc6_.ty = 2;
            }
            else if(_loc5_.textHeight > 30)
            {
               _loc6_.ty = 10;
            }
            else
            {
               _loc6_.ty = 20;
            }
            _loc1_.draw(_loc5_,_loc6_);
            _loc5_.dispose();
            if(sayTag3D == null)
            {
               sayTag3D = new NameTag3D();
               this.tag3DVBox.boxIngoreRoScale.addChild(sayTag3D);
               sayTag3D.renderLayer = Entity.TOP_LAYER;
               sayTag3D.mouseChildren = false;
               sayTag3D.mousePriority = 4;
               sayTag3D.mouseEnabled = false;
               sayTag3D.x = -56;
               sayTag3D.y = 64;
               sayTag3D.z = -1;
            }
            else
            {
               this.sayTag3D.visible = true;
            }
            sayTag3D.setBitmapData(_loc1_,true);
            return;
         }
         while(true)
         {
            _loc2_ = MathUtil.randomInt(sayArr.length - 1,0);
            if(_loc2_ != lasySayIndex)
            {
               lasySayIndex = _loc2_;
            }
         }
      }
      
      override public function dispose() : void
      {
         if(sayTag3D)
         {
            sayTag3D.dispose();
            sayTag3D = null;
         }
         TweenLite.killDelayedCallsTo(this.showSay);
         TweenLite.killDelayedCallsTo(this.hideSay);
         TweenLite.killDelayedCallsTo(doWin);
         TweenLite.killDelayedCallsTo(checkPos);
         TweenLite.killDelayedCallsTo(notifyFollower);
         if(followTarget)
         {
            followTarget.removeEventListener("EVT_Unit3DBase_runStart",unit3d_runStart);
            followTarget.removeEventListener("EVT_Unit3DBase_runCpl",unit3d_runCpl);
            followTarget = null;
         }
         super.dispose();
      }
   }
}
