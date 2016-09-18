package nslm2.modules.scenes.commons
{
   import flash.geom.Matrix3D;
   import away3d.core.math.Vector3DUtils;
   import flash.geom.Vector3D;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.ConfigUtil;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import nslm2.common.ui.components.comp3ds.effs.Avatar3DTreasureBlurEff;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class SceneTreasure3D extends SceneWeapon3D
   {
      
      public static const GAP_NUM:int = 360;
      
      private static var _attackArr:Array;
      
      private static var _defendArr:Array;
       
      
      private var ii:int = 0;
      
      private var _speed:int = 4;
      
      private var _inter:int = 0;
      
      private var _eff:SpecterEffect;
      
      private var _blurEff:Avatar3DTreasureBlurEff;
      
      public function SceneTreasure3D(param1:Unit3DBase, param2:int)
      {
         super(param1,param2);
         ii = param1.treasureInitIndex;
         this.box.scaleAll = DefindConsts.SCENE_AVATAR_SCALE_3D / DefindConsts.SCENE_AVATAR_SCALE_SCENE * 1.3;
      }
      
      public static function get attackArr() : Array
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(_attackArr == null)
         {
            _attackArr = [];
            _loc1_ = new Matrix3D();
            _loc2_ = 0;
            while(_loc2_ < 360)
            {
               _loc1_.position = Vector3DUtils.rotatePoint(new Vector3D(70,0,0),new Vector3D(0,_loc2_,0));
               _loc1_.appendRotation(30,Vector3D.Z_AXIS);
               _attackArr.push(_loc1_.position.clone());
               _loc2_++;
            }
         }
         return _attackArr;
      }
      
      public static function get defendArr() : Array
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(_defendArr == null)
         {
            _defendArr = [];
            _loc1_ = new Matrix3D();
            _loc2_ = 0;
            while(_loc2_ < 360)
            {
               _loc1_.position = Vector3DUtils.rotatePoint(new Vector3D(80,0,0),new Vector3D(0,_loc2_,0));
               _loc1_.appendRotation(150,Vector3D.Z_AXIS);
               _defendArr.push(_loc1_.position.clone());
               _loc2_++;
            }
         }
         return _defendArr;
      }
      
      public static function changeBaowuArr(param1:Array, param2:int, param3:int) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:int = param1.length;
         var _loc4_:* = -1;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ = StcMgr.ins.getItemVo(param1[_loc7_]);
            if(_loc6_.kind == param3)
            {
               _loc4_ = _loc7_;
            }
            _loc7_++;
         }
         if(_loc4_ == -1 && param2 != 0)
         {
            param1.push(param2);
         }
         else if(param2 != 0)
         {
            param1[_loc4_] = param2;
         }
         else
         {
            param1.splice(_loc4_);
         }
      }
      
      public function get vo() : StcItemVo
      {
         return StcMgr.ins.getItemVo(_itemId);
      }
      
      override public function update(param1:int, param2:Number = 0) : void
      {
         var _loc3_:* = null;
         super.update(param1,param2);
         if(vo)
         {
            if(ii >= 360)
            {
               ii = ii - 360;
            }
            _loc3_ = vo.kind == 8?attackArr:defendArr;
            this.x = _loc3_[ii].x;
            this.y = _loc3_[ii].y - 130;
            this.z = _loc3_[ii].z;
            ii = ii + _speed;
            _inter = _inter + param2;
         }
         if(_blurEff && _inter > 60)
         {
            _inter = _inter - 60;
            _blurEff.blurEffect(this.position);
         }
      }
      
      override public function initByModelId(param1:int) : void
      {
         var _loc2_:StcModelVo = StcMgr.ins.getModelVo(param1);
         if(_loc2_ && StringUtils.isNull(_loc2_.extra) == false)
         {
            ConfigUtil.setWeaponUIExtra(this,_loc2_.extra);
         }
         super.initByModelId(param1);
         if(_eff)
         {
            _eff.dispose();
            _eff = null;
         }
         _eff = EffectManager.createEffect(Effect3DUtils.getUrlBySid(6520),true,this.weapon3d);
      }
      
      override protected function allLoadCpl() : void
      {
         super.allLoadCpl();
         AppGlobalContext.animatorManager.register(this);
      }
      
      override public function dispose() : void
      {
         AppGlobalContext.animatorManager.unregister(this);
         if(_blurEff)
         {
            _blurEff.dispose();
            _blurEff = null;
         }
         if(_eff)
         {
            _eff.dispose();
            _eff = null;
         }
         super.dispose();
      }
   }
}
