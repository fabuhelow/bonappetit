/*
* Copyright (c) 2015 Claudius Boettcher (pos.bonappetit@gmail.com)
*
* This file is part of BonAppetit. BonAppetit is an Android based
* Point-of-Sale client-server application for small restaurants.
*
* BonAppetit is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* BonAppetit is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with BonAppetit.  If not, see <http://www.gnu.org/licenses/>.
*/
package com.github.clboettcher.bonappetit.serverentities.menu;

import com.github.clboettcher.bonappetit.common.printing.PrintStrategy;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;

/**
 * An option consisting of a boolean checkbox.
 */
public class CheckboxOption extends Option {

    /**
     * See {@link #getPriceDiff()}.
     */
    private BigDecimal priceDiff = new BigDecimal("0.00");

    /**
     * See {@link #getPrintStrategy()}.
     */
    private PrintStrategy printStrategy = PrintStrategy.DEFAULT;

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE)
                .appendSuper(super.toString())
                .append("priceDiff", priceDiff)
                .append("printStrategy", printStrategy)
                .append("defaultChecked", defaultChecked)
                .toString();
    }

    /**
     * See {@link #getDefaultChecked()}.
     */
    private Boolean defaultChecked = false;

    /**
     * Returns the price difference of this option.
     * <p/>
     * The total price of an order for an item can be calculated
     * using the items price and the price diff of all options.
     *
     * @return The price difference.
     */
    public BigDecimal getPriceDiff() {
        return priceDiff;
    }

    /**
     * @param priceDiff see {@link #getPriceDiff()}.
     */
    public void setPriceDiff(BigDecimal priceDiff) {
        this.priceDiff = priceDiff;
    }

    /**
     * @return The strategy that determines how this option should be printed.
     */
    public PrintStrategy getPrintStrategy() {
        return printStrategy;
    }

    /**
     * @param printStrategy see {@link #getPrintStrategy()}.
     */
    public void setPrintStrategy(PrintStrategy printStrategy) {
        this.printStrategy = printStrategy;
    }

    /**
     * @return The default value to set when this option is ordered.
     */
    public Boolean getDefaultChecked() {
        return defaultChecked;
    }

    /**
     * @param defaultChecked see {@link #getDefaultChecked()}.
     */
    public void setDefaultChecked(Boolean defaultChecked) {
        this.defaultChecked = defaultChecked;
    }

}