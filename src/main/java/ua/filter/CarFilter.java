package ua.filter;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class CarFilter {

    private static final Pattern INT_PATTERN = Pattern.compile("^([0-9]{1,10})$");

    private static final Pattern DECIMAL_PATTERN = Pattern.compile("^([0-9]{1,18}\\.[0-9]{0,2})|([0-9]{1,18}\\,[0-9]{0,2})|([0-9]{1,18})$");

    private List<Integer>  brandIds = new ArrayList<>();

    private List<Integer>  modelIds = new ArrayList<>();

    public List<Integer> getBrandIds() {
        return brandIds;
    }

    public void setBrandIds(List<Integer> brandIds) {
        this.brandIds = brandIds;
    }

    public List<Integer> getModelIds() {
        return modelIds;
    }

    public void setModelIds(List<Integer> modelIds) {
        this.modelIds = modelIds;
    }
}
