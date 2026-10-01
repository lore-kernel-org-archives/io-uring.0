Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6A3FD946
	for <io-uring@vger.kernel.org>; Thu,  1 Oct 2026 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852340; cv=pass; b=Ywwim8JEfdoz8jgqi/8SMW8qIPkEL1cvA+C9jNsTgZbNKmsKy1eLRhwBcna2068mfbxsQUz0MsJ7rqqpnk3hvKhiUpGAHqelJbOq/EewyJ2T79CNNMeBPnMau0IpWBZ/E1SbNBCkJY79SVlEvF3+CWcyUvqmimrkzpwMyZsjs78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852340; c=relaxed/simple;
	bh=KbGEgPnk7vZYR+vl7/TWwf7XdN4fpXM/jHOacnKAOBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKFpomoFQOwXEGfItAEyETI7KYmgdWysgWRQ52FyPeinHyCz3GmE8Iu0ptzwjhdDbxB/jcco3UjH2HIVNGMNZXD4q1lKN7rxw0TfcI+FxW0cPOEu0V17cggSGwJgku0HqRmZQTx265ZbJ7XSWvppebjiei0HfN1NTzmu1XeoF8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEcqxHOi; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEcqxHOi"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso119853066b.0
        for <io-uring@vger.kernel.org>; Thu, 01 Oct 2026 03:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852337; cv=none;
        d=google.com; s=arc-20260327;
        b=eDKXnXmYKnZIf/J0LKDYd+lYiC19Zp3C16STgiwkWVvXNP6Tx1YrV6I91hrD+sG0bS
         MNQlHcT4dR71kFQETeoXPDTGndcA44zgmH+LK4/yt3UkxcFU7Y6hK5/Gf+RJbWArIogT
         KwnJIqXlWIu6MXb3fydzgxWNvZr1rWdorf5DuC6lbrtH1icwgFI2hkX9oCwTxqh66vR1
         DT4o6Ul09zFlTceV7XUu+iyfK/LXLPLsYg+1YC+1P0zUNE9dr55Ygfj7ZDcp/CO/GRg1
         /gOMZdyne6aehb9jj8SZ8ngxm9JKILwDZ5Wnx1YfDrcyUx+Mb8MMWQdwQx6tBaTxnKzl
         sBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KbGEgPnk7vZYR+vl7/TWwf7XdN4fpXM/jHOacnKAOBk=;
        fh=LO4x5dgx/plBTSfOG0C92x1nmSJxC3l9bQMza0CLSqE=;
        b=hOHQrlbUEb98R2uu9Ojmfht8d96h9WBfk/YtKIr4mJJy/8jY/03kzURcek4biukTH4
         AvnXqbGj7R4K9rCBm+Y0V0yVLltLZkULbjO/CNIfygCAJDVCfNBF09n1LvM1hB7sBSim
         mYwDLjp6QUV6aevz89oeJ1hjFa/4kRMZBT/yZRJQE9XFU933IGve7BxsW7flC8HP6ydW
         1FGi/e3kskc/k/GxAwNI3jbHVSlRYFT4tL7eXWEvp8TP3vZIf8bW0UJ8xU8NeF3dsy9h
         mSiueYmOCIvwLNZ428McDZAFS4UKMtyc5wp50YSOsSdShInQjsQI/yVT2j/Dyrm1OjKn
         VBuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790852337; x=1791457137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KbGEgPnk7vZYR+vl7/TWwf7XdN4fpXM/jHOacnKAOBk=;
        b=hEcqxHOiuingEmH8/Sf/LuhYLAdSqW8jSge6P68ARYPY5iL3ADWBzchaRBG93lZvaj
         4fdOlibMDsAe9ZKN9OG18GGIN85g3fNTCE5WVdCBQx0pXZmHdXhddIkOokX/lgMoSEQI
         ul4DMM9QQJiVjGS5L9WnDMx2S78He83pFkxl3+4R/IvT611WmQyC7rZS6dzH4KpUea73
         Jzdp2o16kH3w1+n5+wN8yDAI4TwTuiCzCTtbk+gfC3YcFF7PuLHCmUlcMXb/yM57a2Er
         q1NUkkIHvCWB2Df2CQtU+emKmewyLjnCiqe3SRW87tKLvl4rhDxGcttJKne5naFWrnnn
         GLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852337; x=1791457137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbGEgPnk7vZYR+vl7/TWwf7XdN4fpXM/jHOacnKAOBk=;
        b=p1ESybYGbpEj82ty1WD+0S95O3BSgmUv/Rc7g+UGDD4aL/Ci+6HnKDIUFmz77J8wql
         ZLv+HFvGMEsBLXcQhLCl801mQTN81+xUPu0cRCdmGhMm+k2GnTDysKXW8e+Q4Qn+9s2d
         5Wjm2gbt6QpfC8J/JHadMSJwEmG0xZVNsHCgneh/nVHYqpc3TXuAaw27ZixtPisw2amW
         Ub6AQGNyQS74GurpnDTdFLorskcdUDtB3vxG+MqhivNkD2U3cC69hi24JS3nM9ryV2U7
         /fVbJcnAuhP0rlqhKLmJNQlhSEZBSyUB1sMV2FSp/FjZJAoryYSQpZS9pQP1ImDZaAM4
         Cu/A==
X-Forwarded-Encrypted: i=1; AKwUvBwaVo7uiEDEpniA3dwF5IV0vhEnOlgaVEQ2fV91OBN1+D7zR4VgHBumXd0gp9HqB4tOgoloYeUqlw==@vger.kernel.org
X-Gm-Message-State: AFuF++kkcbDof4AR9Bqt6gID45kX2zXJJa1unlS0pj4ohyzTIS9wYA/W
	mu3uK7GFSyd416IIypzk7Dajtqy5i4vZd2kHFZ0KTpSx2BxwEvU8OyQgWlTAl1Q1qKwnxRUW3BP
	QxvRH/eBSmpj9yyjpj5ZD/bnNYojHOXI=
X-Gm-Gg: AYBFou0c7NLR5Saj9uQKmbvuJcjL2TIa5nynwUqZGMqZTYZM1UKlVpVt5kIa4FvKd3X
	birATnPk+pfzBmXPrVV4zi8e/LNOz7YM/iwCPGnPbMziEXXzFzQUSskzF2IqYYkEtb/oID49wex
	ERBjkix95Gh7dwEfM0+zM+1J7Ja4d0Zc5Ya1WIO9ILiJ78CdD6NFOhmXvaC4/o742K9gIkn8mf8
	EOZIk94mFN94nDbmHod2lMaWmK0jLur+iaaJ4KRZmnc0OqDa0+FResFgUhT2TDPVwzWmzhX4BVD
	YRlXCvrmD39jcImnHECccUolBFDhHCfVMqdahWDqqMt99QicAzVXpRe3nNxtU9GuHwtC6h3FlTY
	HhK3AG4MWMgecIdL89RNlfk2D
X-Received: by 2002:a17:907:9688:b0:c29:5151:16b8 with SMTP id
 a640c23a62f3a-c2e23763c99mr352304566b.2.1790852337129; Thu, 01 Oct 2026
 03:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918090010.1688-1-aditya.ansh182@gmail.com>
 <20260918090010.1688-2-aditya.ansh182@gmail.com> <CADUfDZorK-i+eOEpGkVFf_vJhqLUKfBX9n_rkiWtbcyoMHT8uw@mail.gmail.com>
In-Reply-To: <CADUfDZorK-i+eOEpGkVFf_vJhqLUKfBX9n_rkiWtbcyoMHT8uw@mail.gmail.com>
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Date: Thu, 1 Oct 2026 16:28:41 +0530
X-Gm-Features: AclHuK-FOgD42JgsxASW5ZRNJ_Uwb8ZfRxtR396n_NYyi1ZD5u7-WI5DU3g3XwE
Message-ID: <CAK5ssPOAZ=PGDMjsihKCx87Gw+UBpc0J=NB+pOo8PbSBdzSpgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] tools: sync io_uring.h UAPI header
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>, 
	Gabriel Krisman Bertazi <krisman@suse.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:20=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> Can you drop the tab character and just use a space between the words?
>
> Best,
> Caleb
>
Thanks Caleb, will fix that to use a single space in the next revision.

Hi Jens, Gabriel,

If there are no other comments or concerns with the patch series, I
can send v5 with Caleb's formatting fix addressed. If there are further
changes needed, I can pick them up in v5 along with Caleb's space
suggestion.

Thanks,
Aditya
