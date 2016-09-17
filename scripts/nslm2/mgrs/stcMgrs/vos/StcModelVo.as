package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import nslm2.utils.ConfigUtil;
   import morn.core.utils.StringUtils;
   import com.mz.core.configs.EnvConfig;
   
   public class StcModelVo extends StcVoBase
   {
      
      public static const TYPE_ROLE:int = 1;
      
      public static const TYPE_HERO:int = 2;
      
      public static const TYPE_NPC:int = 3;
      
      public static const TYPE_WEAPON:int = 4;
      
      public static const TYPE_WING:int = 5;
      
      public static const TYPE_MONSTER:int = 6;
      
      public static const TYPE_NO_MODEL:int = 7;
      
      public static const TYPE_OBJECT:int = 8;
      
      public static const TYPE_HORSE:int = 9;
      
      public static const TYPE_FASHION:int = 10;
      
      public static const TYPE_OBJ:int = 11;
      
      public static const TYPE_PET:int = 12;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_model";
       
      
      private var _winRo:int = 2147483647;
      
      public var id:int;
      
      public var kind:int;
      
      public var name:String;
      
      public var effect_id:String;
      
      public var scale:Number;
      
      public var mirror:int;
      
      public var model_path:String;
      
      public var png_path:String;
      
      public var ui_scale:Number;
      
      public var extra:String;
      
      public function StcModelVo()
      {
         super();
      }
      
      public function get winRo() : int
      {
         if(_winRo == 2147483647)
         {
            _winRo = ConfigUtil.getWinRo(this.extra);
         }
         return _winRo;
      }
      
      public function get folder() : String
      {
         switch(int(kind) - 1)
         {
            case 0:
               return "model/role/";
            case 1:
               return "model/hero/";
            case 2:
               return "model/npc/";
            case 3:
               return "model/weapon/";
            case 4:
               return "model/wing/";
            case 5:
               return "model/monster/";
            default:
               return "";
            case 7:
               return "model/obj/";
            case 8:
               return "model/horse/";
            case 9:
               return "model/role/";
            case 10:
               return "model/obj/";
            case 11:
               return "model/pet/";
         }
      }
      
      public function get pathFolder() : String
      {
         return folder + this.name + "/";
      }
      
      public function get path_mesh() : String
      {
         if(!StringUtils.isNull(model_path))
         {
            return folder + model_path;
         }
         return pathFolder + this.name + (this.kind == 11?".obj":".s3d");
      }
      
      public function get path_s3d() : String
      {
         if(!StringUtils.isNull(model_path))
         {
            return folder + model_path;
         }
         return pathFolder + this.name + ".s3d";
      }
      
      public function get path_texture_auto() : String
      {
         if(EnvConfig.ins.useMipMap)
         {
            return this.path_texture_mip_dxt;
         }
         return this.path_texture_dxt;
      }
      
      public function get path_texture() : String
      {
         if(!StringUtils.isNull(png_path))
         {
            return folder + png_path;
         }
         return pathFolder + this.name + ".png";
      }
      
      public function get path_texture_dxt() : String
      {
         return path_texture.replace(".png",".dxt");
      }
      
      public function get path_texture_big() : String
      {
         return path_texture.replace(".png","_big.png");
      }
      
      public function get path_texture_mip_dxt() : String
      {
         return path_texture.replace(".png","_mip.dxt");
      }
      
      public function get path_texture_big_dxt() : String
      {
         return path_texture.replace(".png","_big.dxt");
      }
      
      public function get path_texture_nm() : String
      {
         return path_texture.replace(".png","_nm.png");
      }
      
      public function get path_texture_nm_dxt() : String
      {
         return path_texture_nm.replace(".png",".dxt");
      }
      
      public function get path_texture_nm_mip_dxt() : String
      {
         return path_texture_nm.replace(".png","_mip.dxt");
      }
      
      public function get path_texture_sp() : String
      {
         return path_texture.replace(".png","_sp.png");
      }
      
      public function get path_texture_sp_dxt() : String
      {
         return path_texture.replace(".png","_sp.dxt");
      }
      
      public function get path_texture_sp_mip_dxt() : String
      {
         return path_texture.replace(".png","_sp_mip.dxt");
      }
      
      public function get path_texture_re_png() : String
      {
         return path_texture.replace(".png","_re.png");
      }
      
      public function get path_texture_re_dxt() : String
      {
         return path_texture.replace(".png","_re.dxt");
      }
      
      public function get path_texture_re_mip_dxt() : String
      {
         return path_texture.replace(".png","_re_mip.dxt");
      }
      
      public function get path_s3dActBa1() : String
      {
         return pathFolder + "s3d_act1.ba";
      }
      
      public function get path_s3dActBa2() : String
      {
         return pathFolder + "s3d_act2.ba";
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         kind = param1[1];
         name = param1[2];
         effect_id = param1[3];
         scale = param1[4];
         mirror = param1[5];
         model_path = param1[6];
         png_path = param1[7];
         ui_scale = param1[8];
         extra = param1[9];
      }
   }
}
