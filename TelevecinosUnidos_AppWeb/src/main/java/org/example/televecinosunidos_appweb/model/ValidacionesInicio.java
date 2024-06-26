package org.example.televecinosunidos_appweb.model;

public class ValidacionesInicio {

    public static boolean validarNombre(String nombre) {
        boolean checkStatus = false;

        if (nombre != null) {
            boolean isFirstUpper = Character.isUpperCase(nombre.charAt(0));
            int stringSize = nombre.length();
            boolean isValidSize = (stringSize >= 1 && stringSize <= 100);
            boolean isValidContent = true;

            for (char c : nombre.toCharArray()) {
                if (!Character.isLetter(c) && !Character.isWhitespace(c)) {
                    isValidContent = false;
                    break;
                }
            }

            checkStatus = (isFirstUpper && isValidSize && isValidContent);
        }
        return checkStatus;
    }

    public static boolean validarApellido(String apellido) {
        boolean checkStatus = false;

        if (apellido != null) {
            boolean isFirstUpper = Character.isUpperCase(apellido.charAt(0));
            int stringSize = apellido.length();
            boolean isValidSize = (stringSize >= 1 && stringSize <= 100);
            boolean isValidContent = true;

            for (char c : apellido.toCharArray()) {
                if (!Character.isLetter(c) && !Character.isWhitespace(c)) {
                    isValidContent = false;
                    break;
                }
            }

            checkStatus = (isFirstUpper && isValidSize && isValidContent);
        }
        return checkStatus;
    }

    public static boolean validarDni(String dni) {
        if (dni == null || dni.length() != 8) {
            return false;
        }
        for (char c : dni.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }
        return true;
    }

    public static boolean validarDireccion(String direccion) {
        return direccion != null && direccion.length() <= 150;
    }

    public static boolean validarCorreo(String correo) {
        if (correo == null || correo.length() > 320) {
            return false;
        }
        return correo.endsWith("@gmail.com") && correo.indexOf('@') == correo.lastIndexOf('@') && correo.contains(".");
    }
}
